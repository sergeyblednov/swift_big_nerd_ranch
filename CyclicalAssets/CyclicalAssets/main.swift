//
//  main.swift
//  CyclicalAssets
//
//  Created by Sergiy Blednov on 10/14/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

import Foundation

var bob: Person? = Person(name: "Bob")
print("created \(bob)")

var laptop: Asset? = Asset(name: "Shiny Laptop", value: 1500.0)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175.0)
var backpack: Asset? = Asset(name: "blue Backpack", value: 45.0)

bob?.takeOwnershipOfAsset(asset: laptop!)
bob?.takeOwnershipOfAsset(asset: hat!)

var john: Person? = Person(name: "John")
john?.takeOwnershipOfAsset(asset: hat!)

print("\(hat)")

bob?.giveupOwnershipOfAsset(asset: hat!)

print("While Bob is alive, hat's owner is \(hat!.owner)")
bob = nil
print("the bob variable is now \(bob)")
print("After Bob is deallocated, hat's owner is \(hat!.owner)")

laptop = nil
hat = nil
backpack = nil
