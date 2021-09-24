//
//  ViewModel.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/23/21.
//

import Foundation

class ViewModel{
    
    // hihi
    func orderData(rawCountries: [RawData]) -> [String: (countryRegion: String, confirmed: Int, deaths: Int, recovered: Int)]{
        
        var countries = [String: (countryRegion: String, confirmed: Int, deaths: Int, recovered: Int)]()
        
        for rawCountry in rawCountries {
            if let countryName = countries[rawCountry.countryRegion]?.countryRegion {
             countries[countryName]?.confirmed += Int(rawCountry.confirmed) ?? 0
             countries[countryName]?.deaths += Int(rawCountry.deaths) ?? 0
             countries[countryName]?.recovered += Int(rawCountry.recovered) ?? 0
           } else {
             countries[rawCountry.countryRegion] = (countryRegion: rawCountry.countryRegion ,confirmed: Int(rawCountry.confirmed) ?? 0, deaths: Int(rawCountry.deaths) ?? 0, recovered: Int(rawCountry.recovered) ?? 0)
           }
        }
                return countries
    }
}
