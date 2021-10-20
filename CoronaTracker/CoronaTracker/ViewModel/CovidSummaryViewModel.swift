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
    var confirmed: Int
    var deaths: Int
    var recovered: Int
    
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
    
    init(province: ProvinceState){
        flag = SwiftFlags.flag(for: province.countryRegion) ?? defaultFlag
        countryRegion = province.countryRegion
        confirmed = province.confirmed
        deaths = province.deaths
        recovered = province.recovered
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
                let provinces = self.groupByState(from: response)
                self.countries = self.groupByCountries(from: provinces)

            }.store(in: &subscribers)
    }
    
    private func totalCases(from response: Response){
        covidTotalCases = response.summaryStats.global.confirmed
    }
    
    // The API returns cities, states (or provinces) and/or countries. We need to group the covid cases data (confirmed, deaths and recovered) by state
    private func groupByState(from response: Response) -> [ProvinceState]{
        
        let firstProvince = response.rawData[0]
        var allProvinces = [ProvinceState(rawData: firstProvince)]
                        
        for rawProvince in response.rawData[1...] {
            
            let lastProvinceIndex = allProvinces.count-1
            let province = ProvinceState(rawData: rawProvince)
            
            if allProvinces[lastProvinceIndex].provinceState.isEqual(province.provinceState)  {
                allProvinces[lastProvinceIndex].confirmed += province.confirmed
                allProvinces[lastProvinceIndex].deaths += province.deaths
                allProvinces[lastProvinceIndex].recovered += province.recovered
            }
            else {
                allProvinces.append(province)
            }
        }
        
        return allProvinces
    }
    
    // We need to group the states list (or provinces) by country, as well the covid cases data (confirmed, deaths and recovered).
    private func groupByCountries(from provinces: [ProvinceState]) -> [Country]{
        
        let firstCountry = provinces[0]
        var allCountries = [Country(province: firstCountry)]
        var lastCountryIndex = allCountries.count-1
        
        if !firstCountry.provinceState.isEmpty {
            allCountries[0].cities.append(firstCountry)
        }
        
        for rawCountry in provinces[1...] {

            let country = Country(province: rawCountry)
            
            if allCountries[lastCountryIndex].countryRegion.isEqual(country.countryRegion) {
                allCountries[lastCountryIndex].confirmed += country.confirmed
                allCountries[lastCountryIndex].deaths += country.deaths
                allCountries[lastCountryIndex].recovered += country.recovered
            }
            else {
                allCountries.append(country)
                lastCountryIndex = allCountries.count-1
            }
            
            if !rawCountry.provinceState.isEmpty {
                allCountries[lastCountryIndex].cities.append(rawCountry)
            }
        }
        
        return allCountries
    }
    
}
