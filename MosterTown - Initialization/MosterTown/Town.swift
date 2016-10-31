//
//  Town.swift
//  MosterTown
//
//  Created by Sergiy Blednov on 9/26/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

import Foundation

struct Town {
    let region: String
    var major: Major
    
    var population: Int {
        didSet(oldPopulation) {
            if population < oldPopulation {
                print("The population has changed to \(population) from \(oldPopulation)")
                major.promiseMessage()
            }
        }
    }
    var numberOfStopLights: Int
    
    init?(region: String, major: Major, population: Int, stopLights: Int) {
        if population <= 0 {
            return nil
        }
        self.region = region
        self.major = major
        self.population = population
        numberOfStopLights = stopLights
    }
    
    init?(population: Int, stopLights: Int) {
        self.init(region: "N/A", major: Major(), population: population, stopLights: stopLights)
    }
    
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
        print("Population: \(population), number of stoplights: \(numberOfStopLights); region: \(region)")
    }
    
    mutating func changePopulation(amount: Int) {
        population += amount
        population = population < 0 ? 0 : population
    }
}
