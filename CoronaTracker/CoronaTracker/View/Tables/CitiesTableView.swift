//
//  CityTableView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 10/18/21.
//

import SwiftUI

struct CitiesTableView: View {
    let tableTitle: String = "States (Provinces)"
    var stateProvinces: [StateProvince]
    let flagForRows: String

    var body: some View {
        VStack() {
            HStack{
                Spacer()
                Text(tableTitle)
                    .foregroundColor(.white)
                    .modifier(HeaderStyle())
                    Spacer()
            }
            if !stateProvinces.isEmpty  {
                ScrollView(.vertical){
                    LazyVStack(spacing:8){
                        ForEach(stateProvinces, id: \.id) { stateProvince in
                            RowView(rowContent: stateProvince, flag: flagForRows)
                        }
                    }
                }
            }
            else {
                Text("Information is not available for this country")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .medium))
                    .padding(.vertical,10)
                Spacer()
            }
        }
        .modifier(CountriesTableStyle())
    }
    
}


struct CityTableView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesTableView(stateProvinces: [], flagForRows: "")
    }
}
