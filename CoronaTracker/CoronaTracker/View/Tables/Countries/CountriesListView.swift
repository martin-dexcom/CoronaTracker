//
//  ListView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 10/14/21.
//

import SwiftUI

struct CountriesListView: View {
    let countries: [Country]

    var body: some View {
        LazyVStack(spacing:8){
            ForEach(countries, id: \.id) { country in
                NavigationLink(destination: CitiesSummaryView(country: country)) {
                    RowView(rowContent: country)
                }
            }
        }
    }
}
struct CountriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesListView(countries: testCountries)
    }
}
