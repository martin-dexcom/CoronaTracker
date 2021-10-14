//
//  TestData.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/23/21.
//

import Foundation


let testRawCountry = RawData(provinceState: "Guadalajara", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "20")

let testCountry = Country(rawData: testRawCountry)

let testProvince = ProvinceState(rawData: testRawCountry)

let testCountries = [
    Country(rawData: RawData(provinceState: "", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "0")),
    Country(rawData: RawData(provinceState: "", countryRegion: "USA", confirmed: "120000", deaths: "1200", recovered: "0")),
    Country(rawData: RawData(provinceState: "", countryRegion: "Germany", confirmed: "120000", deaths: "1200", recovered: "0")),
    Country(rawData: RawData(provinceState: "", countryRegion: "Korea", confirmed: "120000", deaths: "1200", recovered: "0")),
    Country(rawData: RawData(provinceState: "", countryRegion: "Egypt", confirmed: "120000", deaths: "1200", recovered: "0")),
    Country(rawData: RawData(provinceState: "", countryRegion: "China", confirmed: "120000", deaths: "1200", recovered: "0")),
    Country(rawData: RawData(provinceState: "", countryRegion: "Australia", confirmed: "120000", deaths: "1200", recovered: "0")),
    Country(rawData: RawData(provinceState: "", countryRegion: "Australia", confirmed: "120000", deaths: "1200", recovered: "0")),
    Country(rawData: RawData(provinceState: "", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "0")),
    Country(rawData: RawData(provinceState: "", countryRegion: "USA", confirmed: "120000", deaths: "1200", recovered: "0")),
    Country(rawData: RawData(provinceState: "", countryRegion: "Germany", confirmed: "120000", deaths: "1200", recovered: "0")),
    Country(rawData: RawData(provinceState: "", countryRegion: "Korea", confirmed: "120000", deaths: "1200", recovered: "0")),
    Country(rawData: RawData(provinceState: "", countryRegion: "Egypt", confirmed: "120000", deaths: "1200", recovered: "0")),
    Country(rawData: RawData(provinceState: "", countryRegion: "China", confirmed: "120000", deaths: "1200", recovered: "0")),
]

let testProvinces = [
    ProvinceState(rawData: RawData(provinceState: "Guadalajara", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "0")),
    ProvinceState(rawData: RawData(provinceState: "CDMX", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "0")),
    ProvinceState(rawData: RawData(provinceState: "Tijuana", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "0")),
    ProvinceState(rawData: RawData(provinceState: "Los Angeles", countryRegion: "USA", confirmed: "120000", deaths: "1200", recovered: "0")),
    ProvinceState(rawData: RawData(provinceState: "Tokyo", countryRegion: "Japan", confirmed: "120000", deaths: "1200", recovered: "0")),
    ProvinceState(rawData: RawData(provinceState: "Osaka", countryRegion: "Japan", confirmed: "120000", deaths: "1200", recovered: "0")),
]

let testProvinceRow = RowContent(province: testProvince)

let testCountryRow = RowContent(country: testCountry)

let testCountriesList = testCountries.map({ country in
    RowContent(country: country)
})


let testProvincesList = testProvinces.map({ province in
    RowContent(province: province)
})
