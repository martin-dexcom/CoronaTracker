//
//  ViewModel.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/23/21.
//

import Foundation
import Combine

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
    let countryRegion: String
    var confirmed: Int
    var deaths: Int
    var recovered: Int
    
    init(rawData: RawData){
        countryRegion = rawData.countryRegion
        confirmed = Int(rawData.confirmed) ?? 0
        deaths = Int(rawData.deaths) ?? 0
        recovered = Int(rawData.recovered) ?? 0
    }
}

struct RowContent: Identifiable{
    let id : UUID
    let titlePlaholder: String
    let confirmedPlaholder: Int
    let deathsPlaceholder: Int
    let recoveredPlaceholder: Int
    
    init(country: Country){
        id = country.id
        titlePlaholder = country.countryRegion
        confirmedPlaholder = country.confirmed
        deathsPlaceholder =  country.deaths
        recoveredPlaceholder = country.recovered
    }
    
    init(province: ProvinceState){
        id = province.id
        titlePlaholder = province.provinceState
        confirmedPlaholder = province.confirmed
        deathsPlaceholder =  province.deaths
        recoveredPlaceholder = province.recovered
    }
}

class CovidSummaryViewModel: ObservableObject{

    let covidAPI = CovidAPI()
    var subscribers = Set<AnyCancellable>()
    @Published var provincesStates : [ProvinceState]?
    @Published var countries : [Country]?
    @Published var covidTotalCases : Int?
    
    func getAllCovidData() {
        covidAPI.getCovidStatsData().receive(on: RunLoop.main)
            .sink { response in
                guard let response = response else { return }
                self.totalCases(from: response)
                self .provincesStates = self.getAllProvinces(from: response)
                self.countries = self.getAllCountries(from: response)

            }.store(in: &subscribers)
    }
    
    private func totalCases(from response: Response){
        covidTotalCases = response.summaryStats.global.confirmed
    }
    private func getAllProvinces(from response: Response) -> [ProvinceState]{
        return response.rawData.map({ rawCountry in
            ProvinceState(rawData: rawCountry)
        })
    }

    private func getAllCountries(from response: Response) -> [Country]{
        
        var allCountries = [Country(rawData: response.rawData[0])]
        
        for rawItem in response.rawData[1...] {

            let country = Country(rawData: rawItem)
            let lastIndex = allCountries.count-1
            
            if allCountries[lastIndex].countryRegion == country.countryRegion {
                allCountries[lastIndex].confirmed += country.confirmed
                allCountries[lastIndex].deaths += country.deaths
                allCountries[lastIndex].recovered += country.recovered
            }
            else {
                allCountries.append(country)
            }
        }
        
        return allCountries
    }
}
