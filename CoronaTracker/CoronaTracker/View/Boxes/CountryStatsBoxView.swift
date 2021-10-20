//
//  CountryStatsBoxView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 10/14/21.
//

import SwiftUI

// Structure for placing country data in a country stats view
struct CountryStatsBoxContent {
    let flag: String
    let countryTitle: String
    let deaths: Int
    let confirmed: Int
    let recovered: Int
    let total: Int
    
    init(country: Country){
        self.flag = country.flag
        self.countryTitle = country.countryRegion
        self.deaths = country.deaths
        self.confirmed = country.confirmed
        self.recovered = country.recovered
        self.total = country.deaths+country.confirmed+country.recovered
    }
}

struct CountryStatsBoxView: View {
    let content: CountryStatsBoxContent
    
    init(country: Country){
        self.content = CountryStatsBoxContent(country: country)
    }
    
    var body: some View {
        VStack (alignment: .center){
            Text(content.flag)
                .font(.system(size: 20))
            Text(content.countryTitle.uppercased())
                .font(.system(size:20, weight: .black))
            Text("\(content.total)")
                .font(.system(size:32, weight: .black))
            Text("Total cases")
                .font(.system(size:10))
                .padding(.bottom, 2)
            
            HStack {
                StatsNumberView(statsNumber: content.deaths, statsNumberColor: Color.red, statsName: "total deaths")
                Spacer()
                StatsNumberView(statsNumber: content.confirmed, statsNumberColor: Color.yellow, statsName: "total active")
                Spacer()
                StatsNumberView(statsNumber: content.recovered, statsNumberColor: Color.green, statsName: "total recovered")
                
            }
        }
        .padding([.leading,.trailing], 18)
        .padding(.top, 12)
        .padding(.bottom, 8)
        .background(Color.white)
        .cornerRadius(10.0)
        
    }
}

struct CountryStatsBoxView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CountryStatsBoxView(country: testCountry)
        }
        .padding(28)
        .background(Color.blue)
    }
}

struct StatsNumberView: View {
    
    var statsNumber: Int
    var statsNumberColor: Color
    var statsName: String
    
    var body: some View {
        VStack {
            Text("\(statsNumber)")
                .font(.system(size:16, weight: .black))
                .foregroundColor(statsNumberColor)
            Text(statsName)
                .font(.system(size:10))
        }
    }
}
