//
//  TestData.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/23/21.
//

import Foundation


let testRawCountry = RawData(city: "", provinceState: "Guadalajara", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "20")

let testProvince = StateProvince(rawData: testRawCountry)

let testCountry = Country(stateProvince: testProvince)

let testProvinces = [
    StateProvince(rawData: RawData(city: "", provinceState: "Guadalajara", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "0")),
    StateProvince(rawData: RawData(city: "", provinceState: "CDMX", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "0")),
    StateProvince(rawData: RawData(city: "", provinceState: "Tijuana", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "0")),
    StateProvince(rawData: RawData(city: "", provinceState: "Los Angeles", countryRegion: "USA", confirmed: "120000", deaths: "1200", recovered: "0")),
    StateProvince(rawData: RawData(city: "", provinceState: "Tokyo", countryRegion: "Japan", confirmed: "120000", deaths: "1200", recovered: "0")),
    StateProvince(rawData: RawData(city: "", provinceState: "Osaka", countryRegion: "Japan", confirmed: "120000", deaths: "1200", recovered: "0")),
]

let auxRawData =
[
    RawData(city: "", provinceState: "", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "0"),
    RawData(city: "", provinceState: "", countryRegion: "USA", confirmed: "120000", deaths: "1200", recovered: "0"),
    RawData(city: "", provinceState: "", countryRegion: "Germany", confirmed: "120000", deaths: "1200", recovered: "0"),
    RawData(city: "", provinceState: "", countryRegion: "Korea", confirmed: "120000", deaths: "1200", recovered: "0"),
    RawData(city: "", provinceState: "", countryRegion: "Egypt", confirmed: "120000", deaths: "1200", recovered: "0"),
    RawData(city: "", provinceState: "", countryRegion: "China", confirmed: "120000", deaths: "1200", recovered: "0"),
    RawData(city: "", provinceState: "", countryRegion: "Australia", confirmed: "120000", deaths: "1200", recovered: "0"),
    RawData(city: "", provinceState: "", countryRegion: "Australia", confirmed: "120000", deaths: "1200", recovered: "0"),
    RawData(city: "", provinceState: "", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "0"),
    RawData(city: "", provinceState: "", countryRegion: "USA", confirmed: "120000", deaths: "1200", recovered: "0"),
    RawData(city: "", provinceState: "", countryRegion: "Germany", confirmed: "120000", deaths: "1200", recovered: "0"),
    RawData(city: "", provinceState: "", countryRegion: "Korea", confirmed: "120000", deaths: "1200", recovered: "0"),
    RawData(city: "", provinceState: "", countryRegion: "Egypt", confirmed: "120000", deaths: "1200", recovered: "0"),
    RawData(city: "", provinceState: "", countryRegion: "China", confirmed: "120000", deaths: "1200", recovered: "0")
]
let auxProvinces = auxRawData.map( { rawItem in StateProvince(rawData: rawItem)} )
let testCountries = auxProvinces.map( { province in Country(stateProvince: province)} )

let testProvinceRow = RowContent(stateProvince: testProvince, flag: "")
let testCountryRow = RowContent(country: testCountry)

