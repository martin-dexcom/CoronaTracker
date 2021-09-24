//
//  Components.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/21/21.
//

import Foundation
import SwiftUI

struct AppTitle: View {
    var icon: String
    var title: String
    
    var body: some View {
        HStack(spacing:5){
            Text(icon)
            Text(title)
        }
        .modifier(AppTitleStyle())
    }
}

struct TitleWithIcon: View {
    var icon: String
    var title: String
    
    var body: some View {
        HStack(spacing:3) {
            Text(icon)
            Text(title)
        }
    }
}

