//: Playground - noun: a place where people can play

import Cocoa

func printPersonGreeting(_ name: String) {
    print("Hello \(name), welcome to playground")
}

printPersonGreeting("Serg")

//func divisionDescription(num: Double, den: Double) {
//    print("\(num) divided by \(den) equals \(num / den)")
//}
//
//divisionDescription(num: 9.0, den: 3.0)

//func divisionDescription(forNumerator num: Double, andDenominator den: Double) {
//    print("\(num) divided by \(den) equals \(num / den)")
//}
//
//divisionDescription(forNumerator: 9.0, andDenominator: 3.0)

func printMultiPersonalGreetings(names: String...) {
    for name in names {
        print("Hello \(name), welcome to playground")
    }
}

printMultiPersonalGreetings(names: "Serg", "Olena", "Daria", "Oleg")

//Defauld parameter value

func divisionDescription(forNumerator num: Double,
                         andDenominator den: Double,
                         withPunctuation punctuation: String = ".") {
    print("\(num) divided by \(den) equals \(num / den)\(punctuation)")
}

divisionDescription(forNumerator: 9.0, andDenominator: 3.0)
divisionDescription(forNumerator: 9.0, andDenominator: 3.0, withPunctuation: "!")

//in-out parameter

var error = "The request failed:"
func appendErrorCode(code: Int, toErrorString errorString: inout String) {
    if code == 400 {
        errorString += " bad request."
    }
}

appendErrorCode(code: 400, toErrorString: &error)
print(error)

//Returning from a Function

func getDivisionDescription(forNumerator num: Double,
                         andDenominator den: Double,
                         withPunctuation punctuation: String = ".") -> String {
    return "\(num) divided by \(den) equals \(num / den)\(punctuation)"
}

print(getDivisionDescription(forNumerator: 15.0, andDenominator: 5.0))

//Multiple returns

func sortEvenOdd(numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return(evens, odds)
}

let aBunchOfNumbers = [10, 1, 4, 3, 56, 53, 86, 25, 31, 156, 110]
let theSortedNumbers = sortEvenOdd(numbers: aBunchOfNumbers)
print("The even numbers: \(theSortedNumbers.evens);\nThe odd numbers: \(theSortedNumbers.odds)")

//Optional REturn Types

func grabMiddleName(name: (String, String?, String)) -> String? {
    return name.1
}

let middleName = grabMiddleName(name: ("Serg", "Jack", "Blednov"))
if let name = middleName {
    print(name)
}

//Existing Early from a Function

func greetingByMiddleName(_ name: (first: String, middle: String? , last: String)) {
    guard let middleName = name.middle else {
        print("Hey there!")
        return
    }
    print("Hey \(middleName)")
}

greetingByMiddleName(("Sergey", nil, "Blednov"))

//Function Types

let evenOddFunction: ([Int]) -> ([Int], [Int]) = sortEvenOdd

print(evenOddFunction([1, 2, 3, 4]))

//Bronze challenge

func greetingByMiddleNameExt(_ name: (first: String, middle: String? , last: String)) {
    guard let middleName = name.middle, middleName.characters.count > 4 else {
        print("Hey there! *")
        return
    }
    print("Hey \(middleName) *")
}

greetingByMiddleNameExt(("Sergey", "Jackson", "Blednov"))

//Sivler Challenge

func beanSifter(gloceryList: [String]) -> (beans: [String], otherGloceries:[String]) {
    var beans = [String]()
    var other = [String]()
    for item in gloceryList {
//        if item.contains("beans") {
        if item.hasSuffix("beans") {
            beans.append(item)
        } else {
            other.append(item)
        }
    }
    return(beans, other)
}

let result = beanSifter(gloceryList: ["green beans", "milk", "black beans", "pinto beans", "apples"])
print(result.beans)
print(result.otherGloceries)









