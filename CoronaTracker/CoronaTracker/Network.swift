//
//  Network.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/22/21.
//

import Foundation

class Network : ObservableObject {
    @Published var totalCases: Int?
    @Published var rawCountries : [RawData]?
    
    func getData(){
        guard let url = URL(string: "https://coronavirus.m.pipedream.net") else {
            print("Invalid URL")
            return
        }
                
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let response = try? JSONDecoder().decode(Response.self, from: data!){
                    self.rawCountries = response.rawData
                    self.totalCases = response.summaryStats.global.confirmed
                    
                    
                    
                } else {
                     print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
                }
            }
        }.resume()
    }
    
}
