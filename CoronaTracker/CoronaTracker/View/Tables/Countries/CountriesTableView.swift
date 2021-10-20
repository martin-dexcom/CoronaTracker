//
//  TableView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 10/14/21.
//

import SwiftUI

struct CountriesTableView: View {
    let tableTitle: String = "Countries"
    var countries: [Country]? = nil
    
    @State private var searchText = ""

    var body: some View {
        VStack() {
            HStack{
                Spacer()
                Text(tableTitle)
                    .foregroundColor(.white)
                    .modifier(HeaderStyle())
                    Spacer()
            }
            if let filteredCountries = searchResults {
                SearchBar(text: $searchText)
                ScrollView(.vertical){
                    CountriesListView(countries: filteredCountries)
                }
            }
            else {
                CustomProgressView(color: Color.white)
                    .padding(.top,10)
                Spacer()
            }
        }
        .modifier(CountriesTableStyle())
    }
    
    var searchResults: [Country]? {
        return countries?.filter({ searchText.isEmpty ? true : $0.countryRegion.uppercased().starts(with: searchText.uppercased()) }) ?? nil
    }
}


struct CountriesTableView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesTableView(countries: testCountries)
    }
}
