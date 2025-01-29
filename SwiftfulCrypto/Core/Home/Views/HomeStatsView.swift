//
//  HomeStatsView.swift
//  SwiftfulCrypto
//
//  Created by Thomas on 1/26/25.
//

import SwiftUI

struct HomeStatsView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPorfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPorfolio ? .leading : .trailing)
    }
}

//#Preview {
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView(showPorfolio: .constant(false))
            .environmentObject(dev.homeVm)
    }
}
