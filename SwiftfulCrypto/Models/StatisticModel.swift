//
//  StatisticModel.swift
//  SwiftfulCrypto
//
//  Created by Thomas on 1/26/25.
//

import Foundation
struct StatisticModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChage: Double?
    
    init (title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChage = percentageChange
    }
}

