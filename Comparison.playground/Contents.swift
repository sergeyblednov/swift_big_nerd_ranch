//: Playground - noun: a place where people can play

import Cocoa

struct Point: Comparable {
    let x: Int
    let y: Int
}

func ==(lhs: Point, rhs: Point) -> Bool {
    return (lhs.x == rhs.x) && (lhs.y == rhs.y)
}

//func <(lhs: Point, rhs: Point) -> Bool {
//    return (lhs.x < rhs.x) && (lhs.y < rhs.y)
//}

//Platinum challenge

func <(lhs: Point, rhs: Point) -> Bool {
    let l = sqrt(Double(lhs.x * lhs.x + lhs.y * lhs.y))
    let r = sqrt(Double(rhs.x * rhs.x + rhs.y * rhs.y))
    return l < r
}

let a = Point(x: 3, y: 4)
let b = Point(x: 3, y: 4)

let abEqual = (a == b)
let abNotEqual = (a != b)


let c = Point(x: 2, y: 6)
let d = Point(x: 3, y: 7)

let cdEqual = (c == d)
let cLessThanD = ( c < d )

let cLessThanEqualD = ( c <= d )

//Bronze challenge 

func +(lhs: Point, rhs: Point) -> Point {
    return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

let s = a + b
print(s)

//Gold challenge 

class Person: CustomStringConvertible, Equatable {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    var description: String {
        return "name: \(name), age: \(age)"
    }
}

func ==(lhs: Person, rhs: Person) -> Bool {
    return (lhs.name == rhs.name) && (lhs.age == rhs.age)
}

let p1 = Person(name: "John", age: 30)
let p2 = Person(name: "Bob", age: 35)
let people = [ p1, p2 ]
print(people)

let p1Index = people.index { $0 == p2 }
print(p1Index!)

//Platinum challenge

let m = Point(x: 1, y: 3)
let n = Point(x: 6, y: 2)

let mLessThann = ( m < n )



