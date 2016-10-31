//
//  main.swift
//  MosterTown
//
//  Created by Sergiy Blednov on 9/26/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

import Foundation

var myTown = Town()
let ts = myTown.townSize
print("Town size: \(ts); population: \(myTown.population)")
myTown.changePopulation(amount: 1000000)
print("Town size: \(myTown.townSize); population: \(myTown.population)")
//myTown.printTownDescription()
//let gm = Monster()
//gm.town = myTown
//gm.terrorizeTown()

let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()
fredTheZombie.changeName(name: "Fred The Zombie", walksWithLimp: false)

fredTheZombie.town?.changePopulation(amount: -5910)
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()
myTown.printTownDescription()

fredTheZombie.town?.changePopulation(amount: 500)
fredTheZombie.town?.printTownDescription()
let noise = Zombie.makeSpookyNoise()
print(noise)

let jackTheVampire = Vampire()
jackTheVampire.terrorizeTown()
jackTheVampire.terrorizeTown()
print("There are infected: \(jackTheVampire.thrall.count)")

print("Victim pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
//let population = fredTheZombie.town?.population ?? 0
print("Victim pool: \(fredTheZombie.victimPool)")
//print("Victim pool: \(fredTheZombie.victimPool); population: \(population)")

print(Zombie.spookyNoise)
print(Monster.spookyNoise)
if(Zombie.isTerrifying) {
    print("Run way!")
}
