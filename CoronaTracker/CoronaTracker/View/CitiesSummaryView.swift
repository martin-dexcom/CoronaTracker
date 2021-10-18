//
//  ProvincesSummaryView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 10/14/21.
//

import SwiftUI

struct CitiesSummaryView: View {
    
    var country: Country
    
    var body: some View {
        ZStack {
            GradientBackgroundView()
            VStack(alignment: .leading ,spacing: nil){
                CountryStatsBoxView(content: CountryStatsBoxContent(country: country))
                    .padding(.bottom, 100)
                CitiesTableView(provinces: country.cities)
            }
            .padding(.leading,28)
            .padding(.trailing,28)
        }
    }
}
struct ProvincesSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesSummaryView(country: testCountry)
    }
}
