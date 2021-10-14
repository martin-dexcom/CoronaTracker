//
//  ProvincesSummaryView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 10/14/21.
//

import SwiftUI

struct ProvincesSummaryView: View {
    
    @ObservedObject var viewModel = CovidSummaryViewModel()
    
    init() {
        viewModel.getAllCovidData()
    }
    
    var body: some View {
        ZStack {
            GradientBackgroundView()
            VStack(alignment: .leading ,spacing: nil){
                CountryStatsBoxView()
                    .padding(.bottom, 100)

                CountriesTableView(countries: viewModel.countries)
                    .padding(.top, 21)
            }
            .padding(.leading,28)
            .padding(.trailing,28)
        }
    }
}
struct ProvincesSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ProvincesSummaryView()
    }
}
