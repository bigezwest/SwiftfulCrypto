//
//  HomeView.swift
//  SwiftfulCrypto
//
//  Created by Thomas on 1/21/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // Background Layer ------------------------------------------------
            Color.theme.background
                .ignoresSafeArea()
            // Content Layer ---------------------------------------------------
            VStack {
                Text("Header")
                Spacer()
            }
            
        }
    }
}

#Preview {
    NavigationView {
        HomeView()
            .navigationBarHidden(true)
    }
}
