//
//  ViewModel.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/23/21.
//

import Foundation
import Combine
import SwiftFlags


struct ProvinceState: Identifiable{
    let id = UUID()
    let provinceState: String
    let countryRegion: String
    let confirmed: Int
    let deaths: Int
    let recovered: Int
    
    init(rawData: RawData){
        provinceState = rawData.provinceState
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
    var cities: [ProvinceState] = []

    init(rawData: RawData){
        flag = SwiftFlags.flag(for: rawData.countryRegion) ?? defaultFlag
        countryRegion = rawData.countryRegion
        confirmed = Int(rawData.confirmed) ?? 0
        deaths = Int(rawData.deaths) ?? 0
        recovered = Int(rawData.recovered) ?? 0
    }
}

class CovidSummaryViewModel: ObservableObject{

    let covidAPI = CovidAPI()
    var subscribers = Set<AnyCancellable>()
    @Published var countries : [Country]?
    @Published var covidTotalCases : Int?
    
    func getAllCovidData() {
        covidAPI.getCovidStatsData().receive(on: RunLoop.main)
            .sink { response in
                guard let response = response else { return }
                self.totalCases(from: response)
                self.countries = self.arrangeCountriesWithCities(from: response)

            }.store(in: &subscribers)
    }
    
    private func totalCases(from response: Response){
        covidTotalCases = response.summaryStats.global.confirmed
    }
    
    private func arrangeCountriesWithCities(from response: Response) -> [Country]{
        
        let firstCountry = response.rawData[0]
        var allCountries = [Country(rawData: firstCountry)]
        var lastCountryIndex = allCountries.count-1
        
        if !firstCountry.provinceState.isEmpty {
            allCountries[0].cities.append(ProvinceState(rawData: firstCountry))
        }
        
        for rawCountry in response.rawData[1...] {

            let country = Country(rawData: rawCountry)
            
            if allCountries[lastCountryIndex].countryRegion == country.countryRegion {
                allCountries[lastCountryIndex].confirmed += country.confirmed
                allCountries[lastCountryIndex].deaths += country.deaths
                allCountries[lastCountryIndex].recovered += country.recovered
            }
            else {
                allCountries.append(country)
                lastCountryIndex = allCountries.count-1
            }
            
            if !rawCountry.provinceState.isEmpty {
                allCountries[lastCountryIndex].cities.append(ProvinceState(rawData: rawCountry))
            }
        }
        
        return allCountries
    }
    
    
    
}
