//
//  TestApi.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/21/21.
//

import Foundation
import SwiftUI

class TestApi {
    var rawCountryData = [RawData]()
    var covidCases: Int?

    func loadData() {
    guard let url = URL(string: "https://coronavirus.m.pipedream.net") else {
        print("Invalid URL")
        return
    }
    
    let request = URLRequest(url: url)
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        
        if let data = data {
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                // we have good data – go back to the main thread
                DispatchQueue.main.async {
                    self.rawCountryData = decodedResponse.rawData

                    if self.rawCountryData.count>1 {
                        print(self.rawCountryData[0])
//                            for pais in rawCountryData {
//                                print(pais)
//                            }
                    }
                    // update our UI
                                            
                    self.covidCases = decodedResponse.summaryStats.global.confirmed
                }

                // everything is good, so we can exit
                return
            }
        }

        // if we're still here it means there was a problem
        print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        
    }.resume()
    
}
}
