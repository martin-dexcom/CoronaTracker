//
//  ContentView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/9/21.
//

import SwiftUI
        
struct GradientBackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.0431372549, blue: 0.968627451, alpha: 1)), Color(#colorLiteral(red: 0.003921568627, green: 0.003921568627, blue: 0.0431372549, alpha: 1)), Color(#colorLiteral(red: 0.3333333333, green: 0.1960784314, blue: 1, alpha: 1))]), startPoint: .top, endPoint: .bottom).ignoresSafeArea(.all, edges: .all)
    }
}

struct CovidSummaryView: View {
    
    @ObservedObject var viewModel = CovidSummaryViewModel()
    
    init() {
        viewModel.getAllCovidData()
    }
    
    var body: some View {
        ZStack {
            GradientBackgroundView()
            VStack(alignment: .leading ,spacing: nil){
                AppTitle(icon: "🦠", title: "CoronaTracker")
                GlobalCasesView(cases: viewModel.covidTotalCases)
                CountriesTableView(countries: viewModel.countries)
                    .padding(.top, 21)
            }
            .padding(.leading,28)
            .padding(.trailing,28)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CovidSummaryView()
    }
}

