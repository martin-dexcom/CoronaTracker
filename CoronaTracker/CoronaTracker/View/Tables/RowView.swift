//
//  CountryRowView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/23/21.
//

import SwiftUI
import SwiftFlags
let defaultFlag = "🇲🇽"


struct RowContent {
    let flagPlaceholder: String
    let titlePlaholder: String
    let confirmedPlaholder: Int
    let deathsPlaceholder: Int
    let recoveredPlaceholder: Int
    
    init(country: Country){
        flagPlaceholder = SwiftFlags.flag(for: country.countryRegion) ?? defaultFlag
        titlePlaholder = country.countryRegion
        confirmedPlaholder = country.confirmed
        deathsPlaceholder =  country.deaths
        recoveredPlaceholder = country.recovered
    }
    
    init(province: ProvinceState){
        flagPlaceholder = SwiftFlags.flag(for: province.countryRegion) ?? defaultFlag
        titlePlaholder = province.provinceState
        confirmedPlaholder = province.confirmed
        deathsPlaceholder =  province.deaths
        recoveredPlaceholder = province.recovered
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


struct RowView: View {
    let rowContent: RowContent
    let id_row_name: String
    
    init(rowContent: ProvinceState){
        self.rowContent = RowContent(province: rowContent)
        self.id_row_name = "id_row_"+rowContent.provinceState.replacingOccurrences(of: " ", with: "_")
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
                Text(rowContent.titlePlaholder)
                    .modifier(HeaderStyle())
                    .accessibility(identifier: id_row_name)
            }
            Spacer()
            StatsView(
                confirmed: rowContent.confirmedPlaholder, deaths: rowContent.deathsPlaceholder, recovered: rowContent.recoveredPlaceholder
            )
        }
        .modifier(CountryRowStyle())
        
    }
}


struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            RowView(rowContent: testProvince)
            RowView(rowContent: testCountry)
        }
    }
}

