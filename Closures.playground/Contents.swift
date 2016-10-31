//: Playground - noun: a place where people can play

import Cocoa

var volunteerCounts = [1, 3, 40, 32, 2, 53, 77, 13]

//func sortAscending(i: Int, j: Int) -> Bool {
//    return i < j
//}
//
//let volunteersSorted = volunteerCounts.sorted(by: sortAscending)

let volunteersSorted = volunteerCounts.sorted { (i: Int, j: Int) -> Bool in
    return i < j
}

let v = volunteerCounts.sorted(by: {
    (i: Int, j: Int) -> Bool in
    return i < j
})
v

let v2 = volunteerCounts.sorted(by: { i, j in i < j })
v2

let v3 = volunteerCounts.sorted(by: { $0 < $1 })
v3

//Functions as Return Types

func makeTownGrand() -> (Int, Int) -> Int {
    func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
        return lightsToAdd + toLights
    }
    return buildRoads
}

var stopLight = 4
let townPlan = makeTownGrand()
stopLight = townPlan(4, stopLight)
print("Knowhere has \(stopLight) stoplights")

//Functions as Arguments

func makeCityGrand(budget: Int, condition: (Int) -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
        func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
            return lightsToAdd + toLights
        }
        return buildRoads
    } else {
        return nil
    }
}
func evaluateBudget(budget: Int) -> Bool {
    return budget > 10000
}

var stopLights = 4

if let cityPlan = makeCityGrand(budget: 1000, condition: evaluateBudget) {
    stopLights = cityPlan(4, stopLights)
}

if let newCityPlan = makeCityGrand(budget: 10500, condition: evaluateBudget) {
    stopLights = newCityPlan(4, stopLights)
}

print("Knowhere city has \(stopLights) stoplights")

//Closure Capture Values

func makeGrowthTracker(forGrowth growth: Int) -> () -> Int {
    var totalGrowth = 0
    func growthTracker() -> Int {
        totalGrowth += growth
        print(totalGrowth)
        return totalGrowth
    }
    return growthTracker
}

var currentPopulation = 5422
let growBy500 = makeGrowthTracker(forGrowth: 500)
growBy500()
growBy500()
growBy500()
currentPopulation += growBy500()
print(currentPopulation)

//Closures Are Reference Types

let anotherGrownBy500 = growBy500
anotherGrownBy500()

var someOtherPopulation = 4061981
let growBy10000 = makeGrowthTracker(forGrowth: 10000)
someOtherPopulation += growBy10000()
currentPopulation

//map(_:)

let precinctPopulations = [1244, 2021, 2157]
let projectedPopulations = precinctPopulations.map {
    (population: Int) -> Int in
    return population * 2
}
print(projectedPopulations)

//filter(_:)

let bigProjections = projectedPopulations.filter { (projection: Int) -> Bool in
    return projection > 4000
}
print(bigProjections)

//reduce(_:combine:)

let totalProjection = projectedPopulations.reduce(0, {
    (accumulatedProjection: Int, precinctProjection: Int) -> Int in
    return accumulatedProjection + precinctProjection
})
print(totalProjection)

//Gold Challenge
print("********** Gold challenge")

let shortProjectedPopulations = precinctPopulations.map { $0 * 2 }
print(shortProjectedPopulations)

let shortBigProjection = projectedPopulations.filter { $0 > 4000 }
print(shortBigProjection)

let shortTotalProjection = projectedPopulations.reduce(0, { $0 + $1 })
print(shortTotalProjection)















