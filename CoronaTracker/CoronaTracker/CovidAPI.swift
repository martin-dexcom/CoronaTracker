//
//  Network.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/22/21.
//

import Foundation
import Combine

class CovidAPI {
    
    private var response = CurrentValueSubject<CovidAPIResponse?, Never>(nil)
    
    func getCovidStatsData() -> CurrentValueSubject<CovidAPIResponse?, Never>{
        guard let url = URL(string: "https://coronavirus.m.pipedream.net") else {
            print("Invalid URL")
            return response
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data , response, error in
            guard let self = self else { return }
            if let data = data {
                if let response = try? JSONDecoder().decode(CovidAPIResponse.self, from: data) {
                    self.response.send(response)
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
        return response
    }
}
