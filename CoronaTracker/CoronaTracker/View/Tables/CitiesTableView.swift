//
//  CityTableView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 10/18/21.
//

import SwiftUI

struct CitiesTableView: View {
    let tableTitle: String = "Cities"
    var provinces: [ProvinceState]

    var body: some View {
        VStack() {
            HStack{
                Spacer()
                Text(tableTitle)
                    .foregroundColor(.white)
                    .modifier(HeaderStyle())
                    Spacer()
            }
            if !provinces.isEmpty  {
                ScrollView(.vertical){
                    LazyVStack(spacing:8){
                        ForEach(provinces, id: \.id) { province in
                            RowView(rowContent: province)
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
        CitiesTableView(provinces: [])
    }
}
