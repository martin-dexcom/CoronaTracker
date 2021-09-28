//
//  CountriesListView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/23/21.
//

import SwiftUI

struct CountriesListView: View {
    let countries : [Country]
    
    var body: some View {
        LazyVStack(spacing:8){
            ForEach(countries, id: \.id) { country in
                CountryRowView(country: country)
            }
        }
    }
}

struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        Text("hola")
        //        CountriesListView(countries: testCountries)
    }
}


