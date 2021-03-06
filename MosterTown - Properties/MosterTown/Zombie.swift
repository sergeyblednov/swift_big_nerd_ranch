//
//  Zombie.swift
//  MosterTown
//
//  Created by Sergiy Blednov on 9/26/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

import Foundation

class Zombie: Monster {
    var walksWithLimp = true
    private(set) var isFallingApart = false
    
    class func makeSpookyNoise() -> String {
        return "Brains..."
    }
    
    override class var spookyNoise: String {
        return "Brains..."
    }
    
    final override func terrorizeTown() {
        if !isFallingApart {
            town?.changePopulation(amount: -10)
        }
        super.terrorizeTown()
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
}
