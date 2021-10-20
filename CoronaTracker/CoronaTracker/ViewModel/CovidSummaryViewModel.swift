//
//  ViewModel.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/23/21.
//

import Foundation
import Combine
import SwiftFlags


let defaultFlag = "🇲🇽"

struct StateProvince: Identifiable{
    let id = UUID()
    let stateProvince: String
    let countryRegion: String
    var confirmed: Int
    var deaths: Int
    var recovered: Int
    
    init(rawData: RawData){
        stateProvince = rawData.provinceState
        countryRegion = rawData.countryRegion
        confirmed = Int(rawData.confirmed) ?? 0
        deaths = Int(rawData.deaths) ?? 0
        recovered = Int(rawData.recovered) ?? 0
    }
}

struct Country: Identifiable{
    let id = UUID()
    let flag: String
    let countryRegion: String
    var confirmed: Int
    var deaths: Int
    var recovered: Int
    var stateProvinces: [StateProvince] = []
    
    init(stateProvince: StateProvince){
        flag = SwiftFlags.flag(for: stateProvince.countryRegion) ?? defaultFlag
        countryRegion = stateProvince.countryRegion
        confirmed = stateProvince.confirmed
        deaths = stateProvince.deaths
        recovered = stateProvince.recovered
    }
}

class CovidSummaryViewModel: ObservableObject{

    let covidAPI = CovidAPI()
    var subscribers = Set<AnyCancellable>()
    @Published var countries: [Country]?
    @Published var covidTotalCases: Int?
        
    func getAllCovidData() {
        covidAPI.getCovidStatsData().receive(on: RunLoop.main)
            .sink { response in
                guard let response = response else { return }
                self.totalCases(from: response)
                
                let stateProvinces = self.groupByState(from: response)
                self.countries = self.groupByCountries(from: stateProvinces)

            }.store(in: &subscribers)
    }
    
    private func totalCases(from response: CovidAPIResponse){
        covidTotalCases = response.summaryStats.global.confirmed
    }
    
    // The API returns cities, states (or provinces) and/or countries. We need to group the covid cases data (confirmed, deaths and recovered) by state
    private func groupByState(from response: CovidAPIResponse) -> [StateProvince]{
        
        let firstStateProvince = response.rawData[0]
        var allStateProvinces = [StateProvince(rawData: firstStateProvince)]
                        
        for rawProvince in response.rawData[1...] {
            
            let lastStateProvinceIndex = allStateProvinces.count-1
            
            let stateProvince = StateProvince(rawData: rawProvince)
            
            if allStateProvinces[lastStateProvinceIndex].stateProvince.isEqual(stateProvince.stateProvince)  {
                allStateProvinces[lastStateProvinceIndex].confirmed += stateProvince.confirmed
                allStateProvinces[lastStateProvinceIndex].deaths += stateProvince.deaths
                allStateProvinces[lastStateProvinceIndex].recovered += stateProvince.recovered
            }
            else {
                // The API returns 2 items as states that aren't valid: "Unknown" and "Recovered", we won't add them
                if !stateProvince.stateProvince.isEqual("Unknown") && !stateProvince.stateProvince.isEqual("Recovered") {
                    allStateProvinces.append(stateProvince)
                }
            }
            
        }
        return allStateProvinces
    }
    
    // We need to group the states list (or provinces) by country, as well the covid cases data (confirmed, deaths and recovered).
    private func groupByCountries(from stateProvinces: [StateProvince]) -> [Country]{
        
        let firstCountry = stateProvinces[0]
        var allCountries = [Country(stateProvince: firstCountry)]
        var lastCountryIndex = allCountries.count-1
        
        if !firstCountry.stateProvince.isEmpty {
            allCountries[0].stateProvinces.append(firstCountry)
        }
        
        for rawCountry in stateProvinces[1...] {

            let country = Country(stateProvince: rawCountry)
            
            if allCountries[lastCountryIndex].countryRegion.isEqual(country.countryRegion) {
                allCountries[lastCountryIndex].confirmed += country.confirmed
                allCountries[lastCountryIndex].deaths += country.deaths
                allCountries[lastCountryIndex].recovered += country.recovered
            }
            else {
                allCountries.append(country)
                lastCountryIndex = allCountries.count-1
            }
            
            if !rawCountry.stateProvince.isEmpty {
                allCountries[lastCountryIndex].stateProvinces.append(rawCountry)
            }
        }
        
        return allCountries
    }
    
}
