//: Playground - noun: a place where people can play

import Cocoa

class MyClass {
    let myProperty: String
    init?(myProperty: String) {
        if myProperty.isEmpty {
            return nil
        }
        self.myProperty = myProperty
    }
}

let myClass = MyClass(myProperty: "Some property")
myClass?.myProperty

struct WeightRecordInLBS {
    let weight: Double

    init(_ pounds: Double) {
        weight = pounds
    }
    
    init(weightInKilos kilos: Double) {
        weight = kilos * 2.20462
    }
}

let wr = WeightRecordInLBS(weightInKilos: 88)
wr.weight

let w2 = WeightRecordInLBS(220)
w2.weight

