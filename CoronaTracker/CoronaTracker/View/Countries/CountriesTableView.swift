//
//  CountriesTableView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/23/21.
//

import SwiftUI

struct CountriesTableView: View {
    let rawCountries : [RawData]?
    
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
                if let countries = rawCountries {
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
        CountriesTableView(rawCountries: testCountries)
            
    }
}
