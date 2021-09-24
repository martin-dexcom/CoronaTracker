//
//  GlobalCasesBox.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/22/21.
//

import SwiftUI

struct GlobalCasesView: View {
    var cases : Int?

    var body: some View {
        VStack (alignment: .leading, spacing: nil){
            HStack {
                TitleWithIcon(icon: "🌎", title: "Global Status").modifier(HeaderStyle())
                Spacer()
                if let covidCases = cases {
                    Text("\(covidCases)").modifier(HeaderStyle())
                }
                else {
                    Text("").modifier(HeaderStyle())
                        .overlay(CustomProgressView().padding(.trailing,35),alignment: .trailing)
                }
            }
            .padding(.top,18)
            Divider()
                .background(Color(#colorLiteral(red: 0.2862745098, green: 0, blue: 0.6196078431, alpha: 1)))
            Text("Total cases").modifier(HeaderStyle())
            if let covidCases = cases {
                Text("\(covidCases)").modifier(TotalCasesStyle())
                    .padding(.bottom,18)
            }
            else {
                Text("").modifier(TotalCasesStyle())
                    .padding(.bottom,18)
                    .overlay(CustomProgressView().padding(.leading,35),alignment: .leading)
            }
        }
        .modifier(GlobalCasesStyle())
        
    }
}

struct GlobalCasesBox_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            GlobalCasesView()
        }
        .padding(28)
        .background(Color.blue)
    }
}
