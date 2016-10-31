//
//  Town.swift
//  MosterTown
//
//  Created by Sergiy Blednov on 9/26/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

import Foundation

struct Town {
    static let region = "South"
    var major = Major()
    
    var population = 5422 {
        didSet(oldPopulation) {
            if population < oldPopulation {
                print("The population has changed to \(population) from \(oldPopulation)")
                major.promiseMessage()
            }
        }
    }
    var numberOfStopLights = 4
    
    enum Size {
        case Small
        case Medium
        case Large
    }
    
    var townSize: Size {
        get {
            switch self.population {
            case 0...10000:
                return Size.Small
            case 10001...100000:
                return Size.Medium
            default:
                return Size.Large
            }   
        }
    }
    
    func printTownDescription() {
        print("Population: \(population), number of stoplights: \(numberOfStopLights)")
    }
    
    mutating func changePopulation(amount: Int) {
        population += amount
        population = population < 0 ? 0 : population
    }
}
