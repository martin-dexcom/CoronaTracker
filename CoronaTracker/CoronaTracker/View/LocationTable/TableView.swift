//
//  TableView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 10/14/21.
//

import SwiftUI

struct TableView: View {
    let tableTitle: String
    let rowsContent: [RowContent]?
    
    var body: some View {
        VStack() {
            HStack{
                Spacer()
                Text(tableTitle)
                    .foregroundColor(.white)
                    .modifier(HeaderStyle())
                    Spacer()
            }
            ScrollView(.vertical){
                if let rowsContent = rowsContent {
                    ListView(rowsContent: rowsContent)
                }
                else {
                    CustomProgressView(color: Color.white)
                }
            }
        }
        .modifier(CountriesTableStyle())
    }
}


struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView(tableTitle: "Countries", rowsContent: testCountriesList)
    }
}
