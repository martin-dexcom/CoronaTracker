//
//  CountryStatsBoxView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 10/14/21.
//

import SwiftUI

struct CountryStatsBoxView: View {
    private let defaultFlag: String = "🇲🇽"
    private let countryTitle: String = "Mexico"
    private let totalCases: Int = 532225
    private let deaths: Int = 112221
    private let confirmed: Int = 210002
    private let recovered: Int = 210002
    
    var body: some View {
        VStack (alignment: .center){
            Text(defaultFlag)
                .font(.system(size: 20))
            Text(countryTitle.uppercased())
                .font(.system(size:20, weight: .black))

            Text("532,225")
                .font(.system(size:32, weight: .black))
            Text("Total cases")
                .font(.system(size:10))
                .padding(.bottom, 2)
            
            HStack {
            StatsNumberView(statsNumber: deaths, statsNumberColor: Color.red, statsName: "total deaths")
                Spacer()
            StatsNumberView(statsNumber: confirmed, statsNumberColor: Color.yellow, statsName: "total active")
                Spacer()
            StatsNumberView(statsNumber: recovered, statsNumberColor: Color.green, statsName: "total recovered")
                
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
            CountryStatsBoxView()
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
