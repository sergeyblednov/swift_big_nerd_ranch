//
//  Accountant.swift
//  CyclicalAssets
//
//  Created by Sergiy Blednov on 10/14/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

import Foundation

class Accountant {
    typealias NetworthChanged = (Double) -> ()
    
    var netWorthChangedHandler: NetworthChanged? = nil
    var netWorth: Double = 0.0 {
        didSet {
            netWorthChangedHandler?(netWorth)
        }
    }
    
    func gainedNewAsset(asset: Asset) {
        netWorth += asset.value
    }
    
    func deleteAsset(asset: Asset) {
        netWorth -= asset.value
    }
}
