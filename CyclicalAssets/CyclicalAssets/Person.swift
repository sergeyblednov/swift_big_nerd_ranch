//
//  Person.swift
//  CyclicalAssets
//
//  Created by Sergiy Blednov on 10/14/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name: String
    let accountant = Accountant()
    var assets = [Asset]()
    var description: String {
        return "Person(\(name))"
    }
    init(name: String) {
        self.name = name
        accountant.netWorthChangedHandler = {
            [weak self] netWorth in
            self?.netWorthDidChanged(netWorth: netWorth)
            return
        }
    }
    deinit {
        print("\(self) is being deallocated")
    }
    
    func takeOwnershipOfAsset(asset: Asset) {
        if asset.owner != nil {
            print("\(asset) has a owner")
        } else {
            asset.owner = self
            assets.append(asset)
            accountant.gainedNewAsset(asset: asset)
        }
    }
    
    func giveupOwnershipOfAsset(asset: Asset) {
        asset.owner = nil
        accountant.deleteAsset(asset: asset)
    }
    
    func netWorthDidChanged(netWorth: Double) {
        print("The net worth of \(self) is now \(netWorth)")
    }
}
