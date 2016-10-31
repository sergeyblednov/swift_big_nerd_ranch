//
//  Vampire.swift
//  MosterTown
//
//  Created by Sergiy Blednov on 9/26/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

import Foundation

class Vampire: Monster {
    var thrall = [Vampire]()
    
    override func terrorizeTown() {
        town?.changePopulation(amount: -1)
        if let newVampire = Vampire(town: town, monsterName: "Unknown") {
            thrall.append(newVampire)
        }
    }
    
}
