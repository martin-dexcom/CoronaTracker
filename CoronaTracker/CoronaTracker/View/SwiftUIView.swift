//
//  SwiftUIView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 10/18/21.
//

import SwiftUI

struct SwiftUIView: View {
    let rowsContent: [RowContent]
    var listDisplaysCities: Bool = false

    var body: some View {
        LazyVStack(spacing:8){
            ForEach(rowsContent, id: \.id) { rowContent in
                NavigationLink(destination: CitiesSummaryView(country: Country(rowContent: rowContent))) {
                RowView(rowContent: rowContent)
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
