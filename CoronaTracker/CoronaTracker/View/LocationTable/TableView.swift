//
//  TableView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 10/14/21.
//

import SwiftUI

struct TableView: View {
    let tableTitle: String
    var rowsContent: [RowContent]? = nil
    
    @State private var searchText = ""

    init(tableTitle: String, countries: [Country]?){
        self.tableTitle = tableTitle
        if let countries = countries {
            self.rowsContent = countries.map({ country in
                RowContent(country: country)
            })
        }
    }
    
    init(tableTitle: String, provinces: [ProvinceState]?){
        self.tableTitle = tableTitle
        if let provinces = provinces {
            self.rowsContent = provinces.map({ province in
                RowContent(province: province)
            })
        }
    }
    
    var body: some View {
        VStack() {
            HStack{
                Spacer()
                Text(tableTitle)
                    .foregroundColor(.white)
                    .modifier(HeaderStyle())
                    Spacer()
            }
            if let rowsContent = searchResults {
                SearchBar(text: $searchText)
                ScrollView(.vertical){
                    ListView(rowsContent: rowsContent)
                }
            }
            else {
                CustomProgressView(color: Color.white)
            }
        }
        .modifier(CountriesTableStyle())
    }
    
    // Not sure is there's other way to return nil implicitly
    var searchResults: [RowContent]? {
        return rowsContent?.filter({ searchText.isEmpty ? true : $0.titlePlaholder.contains(searchText) }) ?? nil
    }
}


struct TableView_Previews: PreviewProvider {
    static var previews: some View {
//        TableView(tableTitle: "Countries", countries: testCountries)
        TableView(tableTitle: "Countries", provinces: testProvinces)
    }
}
