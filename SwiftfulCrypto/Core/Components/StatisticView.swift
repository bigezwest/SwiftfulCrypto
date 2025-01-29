//
//  StatisticsView.swift
//  SwiftfulCrypto
//
//  Created by Thomas on 1/26/25.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            HStack (spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(
                            degrees:(stat.percentageChage ?? 0) >= 0 ? 0 : 180))
                Text(stat.percentageChage?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor((stat.percentageChage ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChage == nil ? 0.0 : 1.0)
        }
    }
}

//#Preview {
struct StatisticView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            StatisticView(stat: dev.stat1)
                .previewLayout(.sizeThatFits)
            StatisticView(stat: dev.stat2)
                .previewLayout(.sizeThatFits)
            StatisticView(stat: dev.stat3)
                .previewLayout(.sizeThatFits)
        }
    }
}
