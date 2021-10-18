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
    @Published var provincesStates : [ProvinceState]?
    @Published var countries : [Country]?
    @Published var covidTotalCases : Int?
    
//    @Published var countriesForTest : [Country]?

    
    func getAllCovidData() {
        covidAPI.getCovidStatsData().receive(on: RunLoop.main)
            .sink { response in
                guard let response = response else { return }
                self.totalCases(from: response)
//                self .provincesStates = self.getAllProvinces(from: response)
                self.countries = self.arrangeCountriesWithCities(from: response)
//                self.printAllCities()

            }.store(in: &subscribers)
    }
    
    private func totalCases(from response: Response){
        covidTotalCases = response.summaryStats.global.confirmed
    }
    
//    private func getAllProvinces(from response: Response) -> [ProvinceState]{
//        return response.rawData.map({ rawCountry in
//            ProvinceState(rawData: rawCountry)
//        })
//    }

    
    private func arrangeCountriesWithCities(from response: Response) -> [Country]{
        
        var allCountries = [Country(rawData: response.rawData[0])]
        var lastIndex = allCountries.count-1

        if response.rawData[0].provinceState != "" {
            allCountries[0].cities.append(ProvinceState(rawData: response.rawData[0]))
        }
        
        for rawItem in response.rawData[1...] {

            let country = Country(rawData: rawItem)
            
            if allCountries[lastIndex].countryRegion == country.countryRegion {
                allCountries[lastIndex].confirmed += country.confirmed
                allCountries[lastIndex].deaths += country.deaths
                allCountries[lastIndex].recovered += country.recovered
            }
            else {
                allCountries.append(country)
                lastIndex = allCountries.count-1
            }
            
            if rawItem.provinceState != "" {
                allCountries[lastIndex].cities.append(ProvinceState(rawData: rawItem))
            }
        }
        
        return allCountries
    }
//
//
//    func getCitiesFromCountry(countryRegion: String) -> [ProvinceState]{
//
//        guard let provinces = provincesStates?.filter({ province in
//            province.countryRegion == countryRegion
//        }) else { return [] }
//        return provinces
//    }
    
    
}
