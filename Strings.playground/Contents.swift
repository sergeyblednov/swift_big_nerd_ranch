//: Playground - noun: a place where people can play

import Cocoa

let str = "Hello, playground"
var mutableStr = "Hello, mutable playground"
mutableStr += "!"

for c: Character in mutableStr.characters {
    print("\(c)")
}

let oneCoolDude = "\u{1F60E}"
let aAcute = "\u{0061}\u{0301}"

for scalar in str.unicodeScalars {
    print("\(scalar.value)")
}

let aAcutePrecomposed = "\u{00E1}"
let b = (aAcute == aAcutePrecomposed)
print("aAcute: \(aAcute.characters.count)")
print("aAcutePrecomposed: \(aAcutePrecomposed.characters.count)")

let fromIndex = str.startIndex
let toPosition = 4
let endIndex = str.index(fromIndex, offsetBy: toPosition)
str.characters.count

str[fromIndex]
str[str.index(before: str.endIndex)]
str[str.index(fromIndex, offsetBy: toPosition)]


let range = fromIndex...endIndex
let firstWord = str[range]

let hello = "\u{0048}\u{0065}\u{006C}\u{006C}\u{006F}"


