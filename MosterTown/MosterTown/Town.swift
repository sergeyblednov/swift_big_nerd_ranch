//
//  Town.swift
//  MosterTown
//
//  Created by Sergiy Blednov on 9/26/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

import Foundation

struct Town {
    var population = 5422
    var numberOfStopLights = 4
    
    func printTownDescription() {
        print("Population: \(population), number of stoplights: \(numberOfStopLights)")
    }
    
    mutating func changePopulation(amount: Int) {
        population += amount
        population = population < 0 ? 0 : population
    }
}
