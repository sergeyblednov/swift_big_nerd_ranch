//
//  Monster.swift
//  MosterTown
//
//  Created by Sergiy Blednov on 9/26/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

import Foundation

class Monster {
    static let isTerrifying = true
    var name: String
    class var spookyNoise: String {
        return "Grrr"
    }
    var town: Town?
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    required init?(town: Town?, monsterName: String) {
        self.town = town
        if monsterName.isEmpty {
            return nil
        }
        name = monsterName
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorizing yet...")
        }
    }
}
