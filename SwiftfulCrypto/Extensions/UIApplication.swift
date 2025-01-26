//
//  UIApplication.swift
//  SwiftfulCrypto
//
//  Created by Thomas on 1/25/25.
//

import Foundation
import SwiftUI
extension UIApplication {
    func endEditing() {
        sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
