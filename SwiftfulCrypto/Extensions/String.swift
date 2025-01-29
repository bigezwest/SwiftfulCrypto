//
//  String.swift
//  SwiftfulCrypto
//
//  Created by Thomas on 1/29/25.
//

import Foundation

extension String {
    var removingHTMLOccurrences: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
