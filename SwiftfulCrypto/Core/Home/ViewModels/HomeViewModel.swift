//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Thomas on 1/22/25.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticModel] = [
        StatisticModel(title: "Title", value: "Value", percentageChange: 1),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value"),
        StatisticModel(title: "Title", value: "Value", percentageChange: -7)
    ]
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        // Updates all coins
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    private func filterCoins(text: String, coins: [CoinModel] ) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        let lowercaasedText = text.lowercased()
        
        return coins.filter{ (coin) -> Bool in
            return coin.name.lowercased().contains(lowercaasedText) ||
            coin.symbol.lowercased().contains(lowercaasedText) ||
            coin.id.lowercased().contains(lowercaasedText)
        }
    }
}
