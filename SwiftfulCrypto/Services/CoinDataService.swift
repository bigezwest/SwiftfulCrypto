//
//  CoinDataService.swift
//  SwiftfulCrypto
//
//  Created by Thomas on 1/22/25.
//

import Foundation
import Combine

class CoinDataService {
    @Published var allCoins: [CoinModel] = []

    var coinSubsription: AnyCancellable?

    init() {
        getData()
    }

    private func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        coinSubsription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubsription?.cancel()
            })
    }
}
