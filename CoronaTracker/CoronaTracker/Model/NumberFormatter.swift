//
//  Formatter.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/21/21.
//

import Foundation
import SwiftUI


struct Formatter {
    func formatNumber(number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: number)) ?? "0"
    }
}

struct FormatterString {
    func formatNumber(number: String) -> String {
        let intNumber = Int(number) ?? 0
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: intNumber)) ?? "0"
    }
}
