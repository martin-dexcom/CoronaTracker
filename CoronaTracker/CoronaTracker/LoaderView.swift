//
//  LoaderView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/23/21.
//

import SwiftUI

struct LoaderView: View {
    @State private var progress: Double = 1.0
    
    var body: some View {
        VStack {
            ProgressView("Task Progress", value: progress, total: 100)
                 .progressViewStyle(CircularProgressViewStyle(tint: .blue))
//                 .background(Color.blue)
                 .foregroundColor(Color.red)
            
            Slider(value: $progress, in: 1...100, step: 0.1)
        }
        .padding()
    }
}

struct ShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .accentColor(.red)
            .shadow(color: Color(red: 0, green: 0.7, blue: 0),
                    radius: 5.0, x: 2.0, y: 2.0)
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
