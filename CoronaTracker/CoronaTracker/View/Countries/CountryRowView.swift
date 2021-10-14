//
//  CountryRowView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/23/21.
//

import SwiftUI
import SwiftFlags

struct StatsView: View {
    let confirmed: Int
    let deaths: Int
    let recovered: Int
    
    var body: some View {
        VStack(spacing:3) {
            Text("\(confirmed)")
                .font(.system(size: 20, weight: .black, design: .default))
                .accessibility(identifier: "id_row_confirmed_stats")
            HStack {
                Text("\(deaths)")
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.3490196078, blue: 0.368627451, alpha: 1)))
                    .accessibility(identifier: "id_row_deaths_stats")
                //                Spacer()
                Text("\(recovered)")
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.7490196078, blue: 0.3450980392, alpha: 1)))
                    .accessibility(identifier: "id_row_recovered_stats")
            }
            .font(.system(size: 8, weight: .black, design: .default))
        }
    }
}

struct CountryRowView: View {
    let country: Country
    let id_row_name: String
    let defaultFlag = "🇲🇽"
    
    init(country: Country){
        self.country = country
        self.id_row_name = "id_row_"+country.countryRegion.replacingOccurrences(of: " ", with: "_") 
    }
    
    var body: some View {
        HStack{
            HStack{
                Text(SwiftFlags.flag(for: country.countryRegion) ?? defaultFlag)
                    .font(.system(size: 30))
                    .accessibility(identifier: "id_row_flag")
                Text(country.countryRegion)
                    .modifier(HeaderStyle())
                    .accessibility(identifier: id_row_name)
            }
            Spacer()
            StatsView(confirmed: country.confirmed, deaths: country.deaths, recovered: country.recovered)
        }
        .modifier(CountryRowStyle())
        
    }
}

struct CountryRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            CountryRowView(country: Country(rawData: testRawCountry))
            CountryRowView(country: Country(rawData: testRawCountry))
        }
    }
}

