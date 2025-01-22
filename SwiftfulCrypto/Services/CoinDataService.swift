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
        
        coinSubsription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink{ (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubsription?.cancel()
            }
    }
}
