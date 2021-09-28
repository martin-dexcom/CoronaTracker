//
//  ViewModel.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/23/21.
//

import Foundation
import Combine

struct Country: Identifiable{
    let id = UUID()
    let countryRegion: String
    let confirmed: Int
    let deaths: Int
    let recovered: Int
    
    init(rawData: RawData){
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
//        covidAPI.response.receive(on: RunLoop.main)
//            .sink { response in
//                guard let response = response else { return }
//                self.totalCases(from: response)
//                self.countries(from: response)
//            }.store(in: &subscribers)
        
        covidAPI.getCovidStatsData().receive(on: RunLoop.main)
            .sink { response in
                guard let response = response else { return }
                self.totalCases(from: response)
                self.countries(from: response)
            }.store(in: &subscribers)
    }
    
    private func totalCases(from response: Response){
        covidTotalCases = response.summaryStats.global.confirmed
    }
    private func countries(from response: Response){
        countries = response.rawData.map({ rawCountry in
            Country(rawData: rawCountry)
        })
    }
    
    // 2. Esperamos hasta obtener el response
    // regresa un completion
    // ya no es necesario guardar en las variable de la clase (no deben ser published)
    // el network no es observable object
    
    
    // 3. Pasamos el response a viewModel
    // el completion lo alojamos en nuestras variables de viewModel
    // estas variables SI son published
    
    
    
    
    /*
     si el response se realiza en async, como puedo ejecutar 
     
     
     */
    
    
    // 4. ContentView se actualiza con los datos de viewModel
    
    
//    func orderData(rawCountries: [RawData]) -> [String: (countryRegion: String, confirmed: Int, deaths: Int, recovered: Int)]{
//
//        var countries = [String: (countryRegion: String, confirmed: Int, deaths: Int, recovered: Int)]()
//
//        for rawCountry in rawCountries {
//            if let countryName = countries[rawCountry.countryRegion]?.countryRegion {
//             countries[countryName]?.confirmed += Int(rawCountry.confirmed) ?? 0
//             countries[countryName]?.deaths += Int(rawCountry.deaths) ?? 0
//             countries[countryName]?.recovered += Int(rawCountry.recovered) ?? 0
//           } else {
//             countries[rawCountry.countryRegion] = (countryRegion: rawCountry.countryRegion ,confirmed: Int(rawCountry.confirmed) ?? 0, deaths: Int(rawCountry.deaths) ?? 0, recovered: Int(rawCountry.recovered) ?? 0)
//           }
//        }
//                return countries
//    }
    
    
}
