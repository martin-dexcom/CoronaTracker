//
//  CityTableView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 10/18/21.
//

import SwiftUI

struct CitiesTableView: View {
    let tableTitle: String = "Cities"
    var provinces: [ProvinceState]? = nil

    var body: some View {
        VStack() {
            HStack{
                Spacer()
                Text(tableTitle)
                    .foregroundColor(.white)
                    .modifier(HeaderStyle())
                    Spacer()
            }
            if let provinces = provinces {
                ScrollView(.vertical){
                    LazyVStack(spacing:8){
                        ForEach(provinces, id: \.id) { province in
                            RowView(rowContent: province)
                        }
                    }
                }
            }
            else {
                CustomProgressView(color: Color.white)
            }
        }
        .modifier(CountriesTableStyle())
    }
    
}


struct CityTableView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesTableView(provinces: testProvinces)
    }
}
