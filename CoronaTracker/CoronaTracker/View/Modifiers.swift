//
//  Modifiers.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/21/21.
//

import Foundation
import SwiftUI


struct AppTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.white)
            .font(.system(size: 37, weight: .black, design: .default))
    }
}

struct HeaderStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size:20, weight: .semibold, design: .default))
    }
}

struct TotalCasesStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size:23, weight: .semibold, design: .default))
    }
}

struct GlobalCasesStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.leading, 18)
            .padding(.trailing, 18)
            .background(Color.white)
            .cornerRadius(10.0)
    }
}

struct CountryRowStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 11, leading: 8, bottom: 11, trailing: 6))
            .foregroundColor(.white)
            .background(Color(#colorLiteral(red: 0.07450980392, green: 0.01568627451, blue: 0.3176470588, alpha: 1)))
            
    }
}

struct CountriesTableStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 15, trailing: 15))
            .background(Color(#colorLiteral(red: 0.0431372549, green: 0.01176470588, blue: 0.1764705882, alpha: 1)))
            .cornerRadius(8.0)
    }
}
