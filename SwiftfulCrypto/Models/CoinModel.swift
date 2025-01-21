//
//  CoinModel.swift
//  SwiftfulCrypto
//
//  Created by Thomas on 1/21/25.
//

import Foundation

// MARK: - Welcome
struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    func updateHolding(amount: Double) -> CoinModel {
        return CoinModel(
            id: id,
            symbol: symbol,
            name: name,
            image: image,
            currentPrice: currentPrice,
            marketCap: marketCap,
            marketCapRank: marketCapRank,
            fullyDilutedValuation: fullyDilutedValuation,
            totalVolume: totalVolume,
            high24H: high24H,
            low24H: low24H,
            priceChange24H: priceChange24H,
            priceChangePercentage24H: priceChangePercentage24H,
            marketCapChange24H: marketCapChange24H,
            marketCapChangePercentage24H: marketCapChangePercentage24H,
            circulatingSupply: circulatingSupply,
            totalSupply: totalSupply,
            maxSupply: maxSupply,
            ath: ath,
            athChangePercentage: athChangePercentage,
            athDate: athDate,
            atl: atl,
            atlChangePercentage: atlChangePercentage,
            atlDate: atlDate,
            lastUpdated: lastUpdated,
            sparklineIn7D: sparklineIn7D,
            priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency,
            currentHoldings: amount
        )
    }
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}


/* CoinGecko API info
 --url 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&per_page=250&page=1&sparkline=true&price_change_percentage=24h'
 --jsonResponse
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
     "current_price": 103712,
     "market_cap": 2052867137394,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 2052867137394,
     "total_volume": 110448129722,
     "high_24h": 106614,
     "low_24h": 100142,
     "price_change_24h": -1818.8675491738832,
     "price_change_percentage_24h": -1.72355,
     "market_cap_change_24h": -61845559056.468506,
     "market_cap_change_percentage_24h": -2.92454,
     "circulating_supply": 19813159,
     "total_supply": 19813159,
     "max_supply": 21000000,
     "ath": 108786,
     "ath_change_percentage": -4.84958,
     "ath_date": "2025-01-20T09:11:54.494Z",
     "atl": 67.81,
     "atl_change_percentage": 152549.18971,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2025-01-21T15:46:29.334Z",
     "sparkline_in_7d": {
       "price": [
         95944.70227292187,
         96294.5147067344,
         96149.71628658813,
         96378.29791315526,
         95703.54557746142,
         96479.71578368786,
         96725.04207974242,
         96445.88153298218,
         96376.90845087137,
         96436.0987455667,
         96732.3889915353,
         96535.26005426567,
         96898.59910352033,
         97319.90221599893,
         96793.91016297831,
         97344.12825674939,
         97152.95580661457,
         96975.82520640592,
         97070.2794164871,
         97253.12746750425,
         97164.45043723319,
         96767.4148350854,
         96973.352177932,
         96733.2206123082,
         96860.46404141473,
         99009.34518592388,
         99698.21009750044,
         99020.1903405399,
         99059.52193283464,
         98587.29406546001,
         99424.49575228071,
         99895.53095971681,
         99552.02519007656,
         99682.76797759626,
         99725.40578888806,
         100554.74910518984,
         99872.64953934235,
         100070.56672454652,
         99630.51544331563,
         99439.88898395892,
         99587.38224559338,
         99368.90225582317,
         99764.60640651133,
         99739.74868905671,
         98969.27851480305,
         99119.30544691836,
         99175.81276396391,
         99136.88555434979,
         99365.30032161868,
         99020.76827900368,
         97532.25346033007,
         99184.80509513128,
         99454.01193663836,
         99946.48723935365,
         99556.10838859396,
         100377.75137459932,
         100376.57643817428,
         100078.78309833872,
         99877.5171161229,
         99977.5043880182,
         100136.85201437982,
         101711.2074763743,
         100922.94387590281,
         101017.72621672494,
         101472.95109233055,
         101323.58976179131,
         101379.5988448226,
         101529.03229986163,
         102125.38053312013,
         101924.67840754567,
         102243.20379737619,
         102254.35493395521,
         102766.20386573607,
         102659.3182258968,
         102994.50779036949,
         103992.60133717468,
         105079.04362992843,
         104135.15109877157,
         104869.64731855925,
         105850.05041675539,
         104720.97204550826,
         104604.0491255822,
         104347.54717350486,
         104125.16350264964,
         104649.37697946737,
         104302.30585740918,
         104270.12396931878,
         103595.00034193484,
         103572.13908788774,
         102721.6188330088,
         103403.60335414654,
         102777.51756053416,
         103267.53002630705,
         103164.20680427943,
         103119.47099954754,
         103518.15895444644,
         103386.25469855574,
         103816.88335938336,
         103964.24313651744,
         104838.54828188014,
         103160.61556090412,
         103767.46023413789,
         103998.0354145325,
         104274.99450502178,
         103948.44962343243,
         103770.53503226313,
         104216.89840135271,
         104451.81705559652,
         104225.99000294389,
         104397.09550527664,
         104727.17434469632,
         104990.56327421108,
         104843.20490107588,
         105022.72010867664,
         105286.20507652058,
         105006.139909608,
         104213.78386537512,
         105161.03375477593,
         104663.03110592213,
         104183.90446402156,
         104763.60494374142,
         104794.97463549642,
         105052.62895290433,
         104612.46378765638,
         104833.7760870572,
         105001.04819610785,
         104940.53153985427,
         106085.44055825933,
         105758.54910814636,
         103522.29406215232,
         103221.86907925215,
         101275.33714814208,
         99717.60975037608,
         100542.11260095066,
         101655.82318713676,
         101817.43508803177,
         102058.75404251853,
         102455.24137078089,
         107294.60981195435,
         107127.07048412197,
         108228.26762528597,
         108013.55026978825,
         108041.04174416988,
         108161.99567857297,
         106822.73509873448,
         107813.34871276142,
         107706.0110635397,
         104908.16562559467,
         106427.96405865643,
         102864.58353348567,
         104072.56426573706,
         103686.82991966167,
         103497.42529916775,
         102377.84102066602,
         103446.73844314495,
         102094.72883937496,
         101063.53964636955,
         101243.9137563174,
         102447.6852125143,
         102966.85852955778,
         101978.34294917599,
         101243.17261680542,
         101924.34094024563,
         101885.47607960703,
         102336.84862624663,
         102574.84629104717,
         103051.92019929607,
         103680.99694575471
       ]
     },
     "price_change_percentage_24h_in_currency": -1.7235474036054659
   }
 
 */
