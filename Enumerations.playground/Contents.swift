//: Playground - noun: a place where people can play

import Cocoa

enum TextAlignment: Int {
    case Left       = 20
    case Right      = 30
    case Center     = 40
    case Justify    = 50
}

var alignment = TextAlignment.Left
alignment = .Right

if alignment == .Right {
    print("We shouls right-align the text!")
}

switch alignment {
case .Left:
    print("left slignment has raw value \(alignment.rawValue)")
case .Right:
    print("right slignment has raw value \(alignment.rawValue)")
case .Center:
    print("center slignment has raw value \(alignment.rawValue)")
case .Justify:
    print("justify")
}

let myRawValue = 20

if let myAlignment = TextAlignment(rawValue: myRawValue) {
    print("successfully converted \(myRawValue) into a TextAlignment")
} else {
    print("\(myRawValue) has no corresponding TextAlignment case")
}

enum ProgrammingLanguage: String {
    case Swift
    case ObjectiveC = "Ocjective-C"
    case C
    case Cpp        = "C++"
    case Java
}

let myFavoriteLanguage = ProgrammingLanguage.Swift
print("My favorite language is \(myFavoriteLanguage.rawValue)")

//Methods

enum Lightbulb {
    case On
    case Off
    
    func surgaceTemperatureForAmbientTemperature(ambient: Double) -> Double {
        switch self {
        case .On:
            return ambient + 150.0
        case .Off:
            return ambient
        }
    }
    
    mutating func toggle() {
        switch self {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}

var bulb = Lightbulb.On
let ambientTemperature = 77.0

var bulbTemperature = bulb.surgaceTemperatureForAmbientTemperature(ambient: ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")

bulb.toggle()
bulbTemperature = bulb.surgaceTemperatureForAmbientTemperature(ambient: ambientTemperature)
print("the bulb's temperature is \(bulbTemperature)")

//Associated Values

enum ShapeDimensions {
    case Point
    case Square(Double)
    case Rectangle(width: Double, height: Double)
    case Triangle(legA: Double, legB: Double)
    
    func area() -> Double {
        switch self {
        case .Point:
            return 0
        case let .Square(side):
            return side * side
        case let .Rectangle(width: w, height: h):
            return w * h
        case let .Triangle(legA: a, legB: b):
            return (a * b ) / 2
        }
    }
    
    func perimeter() -> Double {
        switch self {
        case .Point:
            return 0
        case let .Square(side):
            return 4 * side
        case let .Rectangle(width: w, height: h):
            return 2 * w + 2 * h
        case let .Triangle(legA: a, legB: b):
            return a + b + sqrt(a * a + b * b)
        }
    }
}

var squareShape = ShapeDimensions.Square(10.0)
var rectShape = ShapeDimensions.Rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.Point

print("square's area = \(squareShape.area())")
print("rect's area = \(rectShape.area())")
print("point's area = \(pointShape.area())")

//Recursive Enumerations

enum FamilyTree {
    case NoKnownParents
    indirect case OneKnownParent(name: String, ancestors: FamilyTree)
    indirect case TwoKnownParents(fatherName: String, fatherAncestors: FamilyTree,
        motherName: String, motherAncestors: FamilyTree)
}

let fredAncestors = FamilyTree.TwoKnownParents(
    fatherName: "Fred Sr.",
    fatherAncestors: .OneKnownParent(name: "Beth", ancestors: .NoKnownParents),
    motherName: "Marsha",
    motherAncestors: .NoKnownParents)

//Bronze Challenge
print("Bronze Challenge *************")

print("square's perimeter = \(squareShape.perimeter())")
print("rect's perimeter = \(rectShape.perimeter())")
print("point's perimeter = \(pointShape.perimeter())")

//Silver Challenge
print("Silver Challenge *************")


var trialgleShape = ShapeDimensions.Triangle(legA: 3.0, legB: 4.0)
print("triangle's area = \(trialgleShape.area())")
print("triangle perimeter = \(trialgleShape.perimeter())")

