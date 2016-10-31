//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
var playgroundGreeeting = str
playgroundGreeeting += "! How are you today?"
str

class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}

let hecate = GreekGod(name: "Hecate")
let anotherHecade = hecate

anotherHecade.name = "AnotherHecate"
anotherHecade.name
hecate.name

struct Pantheon {
    let chiefGod: GreekGod
    let dateCreated = NSDate()
}

let pantheon = Pantheon(chiefGod: hecate)
let zeus = GreekGod(name: "Zeus")
zeus.name = "Zeus Jr."
zeus.name

pantheon.chiefGod.name
let greekPantheon = pantheon
hecate.name = "Trivia"
greekPantheon.chiefGod.name

//Copying

let athena = GreekGod(name: "Athena")
let gods = [athena, hecate, zeus]
let godsCopy = gods
gods.last?.name = "Jupiter"
gods
godsCopy

athena === hecate










