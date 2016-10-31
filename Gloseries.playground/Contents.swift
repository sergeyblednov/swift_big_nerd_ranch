//: Playground - noun: a place where people can play

import Cocoa

var gloceryBag = Set<String>()
gloceryBag.insert("Apples")
gloceryBag.insert("Oranges")
gloceryBag.insert("Pineapple")

for food in gloceryBag {
    print(food)
}

let friendGloceryBag = Set(["Apples", "Peaches", "Dill", "Milk"])
var roommateGloceryBag: Set = ["Apples", "Bannanas", "Cereal", "Parsley"]

let hasBannanas = gloceryBag.contains("Bannanas")
let commonGloceryBag = gloceryBag.union(friendGloceryBag)
print("glocery Bag: \(gloceryBag)")
print("union. Common: \(commonGloceryBag)")

let itemsToReturn = commonGloceryBag.intersection(roommateGloceryBag)
print("intersection: \(itemsToReturn)")

let yourSecondBag = Set(["Berries", "Yogurt", "Honey"])
let roommateSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourSecondBag.isDisjoint(with: roommateSecondBag)

//Bronze Challenge

let myCities = Set(["Atlanta", "Chicago", "Jacksonville", "New York", "San Francisco"])
let yourCities: Set = ["Chicago", "San Francisco", "Jacksonville"]
let herCities: Set = ["Chicago", "San Francisco", "Jacksonville"]

let isSuperSet = myCities.isSuperset(of: yourCities)
let isSubSet = yourCities.isSubset(of: myCities)
let isStrictSubSet = yourCities.isStrictSubset(of: herCities)

//Silver Challenge

gloceryBag.formUnion(friendGloceryBag)
print("glocery Bag: \(gloceryBag)")
gloceryBag.formIntersection(roommateGloceryBag)
print("glocery Bag: \(gloceryBag)")


