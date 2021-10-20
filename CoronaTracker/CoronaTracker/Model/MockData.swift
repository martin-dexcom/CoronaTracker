//
//  TestData.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/23/21.
//

import Foundation


let testRawCountry = RawData(city: "", provinceState: "Guadalajara", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "20")

let testProvince = ProvinceState(rawData: testRawCountry)

let testCountry = Country(province: testProvince)

let testProvinces = [
    ProvinceState(rawData: RawData(city: "", provinceState: "Guadalajara", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "0")),
    ProvinceState(rawData: RawData(city: "", provinceState: "CDMX", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "0")),
    ProvinceState(rawData: RawData(city: "", provinceState: "Tijuana", countryRegion: "Mexico", confirmed: "120000", deaths: "1200", recovered: "0")),
    ProvinceState(rawData: RawData(city: "", provinceState: "Los Angeles", countryRegion: "USA", confirmed: "120000", deaths: "1200", recovered: "0")),
    ProvinceState(rawData: RawData(city: "", provinceState: "Tokyo", countryRegion: "Japan", confirmed: "120000", deaths: "1200", recovered: "0")),
    ProvinceState(rawData: RawData(city: "", provinceState: "Osaka", countryRegion: "Japan", confirmed: "120000", deaths: "1200", recovered: "0")),
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
let auxProvinces = auxRawData.map( { rawItem in ProvinceState(rawData: rawItem)} )
let testCountries = auxProvinces.map( { province in Country(province: province)} )

let testProvinceRow = RowContent(province: testProvince)
let testCountryRow = RowContent(country: testCountry)

