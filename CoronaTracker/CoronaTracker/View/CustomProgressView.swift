//
//  ProgressTestView.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/22/21.
//

import SwiftUI

struct CustomProgressView: View {
    
    @State private var progress: Double = 1.0
    var color = Color.gray
    var body: some View {
        ProgressView("", value: progress, total: 100)
            .progressViewStyle(CircularProgressViewStyle(tint: color))
    }
}
struct CustomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            CustomProgressView(color: Color.blue)
            CustomProgressView()
                
//                .background(Color.black)
            
        }
    }
}
