//
//  Zombie.swift
//  MosterTown
//
//  Created by Sergiy Blednov on 9/26/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

import Foundation

class Zombie: Monster {
    var walksWithLimp: Bool
    private(set) var isFallingApart: Bool
    
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
    
    convenience required init?(town: Town?, monsterName: String) {
        self.init(limp: false, fallingApart: false, town: town, monsterName: monsterName)
    }
    
    init?(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    
    convenience init?(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        if walksWithLimp {
            print("This zombie has a bad knee.")
        }
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
    
    deinit {
        print("Zombie named \(name) is no longer with us.")
    }
}
