//
//  CityListView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 10/18/21.
//

import SwiftUI

struct CityListView: View {
    let rowsContent: [RowContent]
    var listDisplaysCities: Bool = false

    var body: some View {
        LazyVStack(spacing:8){
            ForEach(rowsContent, id: \.id) { rowContent in
                RowView(rowContent: rowContent)
            }
        }
    }
}
struct CityListView_Previews: PreviewProvider {
    static var previews: some View {
        CityListView(rowsContent: testProvincesList)

    }
}
