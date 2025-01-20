//
//  ContentView.swift
//  SwiftfulCrypto
//
//  Created by Thomas on 1/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                Text("Accent Color")
                Text("Secondary Text Color")
                Text("Red Color")
                Text("Green Color")
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
