//
//  CountriesTableView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/23/21.
//

import SwiftUI

struct CountriesTableView: View {
    let countries : [Country]?
    
    var body: some View {
        VStack() {
            HStack{
                Spacer()
                Text("Countries")
                    .foregroundColor(.white)
                    .modifier(HeaderStyle())
                    Spacer()
            }
            ScrollView(.vertical){
                if let countries = countries {
                    CountriesListView(countries: countries)
                }
                else {
                    CustomProgressView(color: Color.white)
                }
            }
        }
        .modifier(CountriesTableStyle())
    }
}

struct CountriesTableView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesTableView(countries: testCountries)
    }
}
