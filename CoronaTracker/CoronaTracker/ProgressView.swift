//
//  ProgressView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/22/21.
//

import SwiftUI

struct ProgressView: View {
    
    @State private var progress: Double = 1.0
    
    var body: some View {
 
        VStack {
            ProgressView("Task Progress", value: progress, total: 100)
                .progressViewStyle(LinearProgressViewStyle())
            Slider(value: $progress, in: 1...100, step: 0.1)
        }
        .padding()
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
