//
//  Response.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/13/21.
//

import Foundation


struct Response: Codable {
    let summaryStats: SummaryStats
    let rawData: [RawData]
}

// MARK: - SummaryStats
struct SummaryStats: Codable {
    let global, china, nonChina: Stats
}

// MARK: - Stats
struct Stats: Codable {
    let confirmed: Int
    let recovered: Int?
    let deaths: Int
}

// MARK: - RawData
struct RawData: Codable, Identifiable {
    let id = UUID()
    let city: String
    let provinceState: String
    let countryRegion: String
    let confirmed: String
    let deaths: String
    let recovered: String
    
  private enum CodingKeys: String, CodingKey {
    case city = "Admin2"
    case provinceState = "Province_State"
    case countryRegion = "Country_Region"
    case confirmed = "Confirmed"
    case deaths = "Deaths"
    case recovered = "Recovered"
  }

}




