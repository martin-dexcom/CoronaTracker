//
//  CountryRowView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/23/21.
//

import SwiftUI


//Structure for placing row data, works for countries and provinces (or states)
struct RowContent {
    let flagPlaceholder: String
    let titlePlaceholder: String
    let confirmedPlaceholder: Int
    let deathsPlaceholder: Int
    let recoveredPlaceholder: Int
    
    init(country: Country){
        flagPlaceholder = country.flag
        titlePlaceholder = country.countryRegion
        confirmedPlaceholder = country.confirmed
        deathsPlaceholder =  country.deaths
        recoveredPlaceholder = country.recovered
    }
    
    init(stateProvince: StateProvince, flag: String){
        flagPlaceholder = flag
        titlePlaceholder = stateProvince.stateProvince
        confirmedPlaceholder = stateProvince.confirmed
        deathsPlaceholder =  stateProvince.deaths
        recoveredPlaceholder = stateProvince.recovered
    }
}

struct RowView: View {
    let rowContent: RowContent
    let id_row_name: String
    
    init(rowContent: StateProvince, flag: String){
        self.rowContent = RowContent(stateProvince: rowContent, flag: flag)
        self.id_row_name = "id_row_"+rowContent.stateProvince.replacingOccurrences(of: " ", with: "_")
    }
    
    
    init(rowContent: Country){
        self.rowContent = RowContent(country: rowContent)
        self.id_row_name = "id_row_"+rowContent.countryRegion.replacingOccurrences(of: " ", with: "_")
    }
    
    var body: some View {
        HStack{
            HStack{
                Text(rowContent.flagPlaceholder)
                    .font(.system(size: 30))
                    .accessibility(identifier: "id_row_flag")
                Text(rowContent.titlePlaceholder)
                    .modifier(HeaderStyle())
                    .accessibility(identifier: id_row_name)
            }
            Spacer()
            StatsView(
                confirmed: rowContent.confirmedPlaceholder, deaths: rowContent.deathsPlaceholder, recovered: rowContent.recoveredPlaceholder
            )
        }
        .modifier(CountryRowStyle())
        
    }
}

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

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            RowView(rowContent: testProvince, flag: "")
            RowView(rowContent: testCountry)
        }
    }
}

