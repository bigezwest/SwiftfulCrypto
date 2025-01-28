//
//  HapticManager.swift
//  SwiftfulCrypto
//
//  Created by Thomas on 1/28/25.
//

import Foundation
import SwiftUI
class HapticManager {
    private static let generator = UINotificationFeedbackGenerator()

    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
