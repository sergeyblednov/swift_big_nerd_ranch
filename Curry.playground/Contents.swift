//: Playground - noun: a place where people can play

import Cocoa

func greetName(name: String, withGreeting greeting: String) -> String {
    return "\(greeting) \(name)"
}

let personalGreeting = greetName(name: "Serg", withGreeting: "Hello,")
print(personalGreeting)

func greetingForName(name: String) -> (String) -> String {
    func greeting(greeting: String) -> String {
        return "\(greeting) \(name)"
    }
    return greeting
}

let greeterFuction = greetingForName(name: "Sergey")
let theGreeting = greeterFuction("Hi,")
print(theGreeting)

func greeting(greeting: String, name: String) -> String {
    return "\(greeting) \(name)"
}

print(greeting(greeting: "Hi,", name: "Sergey"))

struct Person {
    var firstName = "Sergey"
    var lastName = "Blednov"
    
    mutating func changeName(fn: String, ln: String) {
        firstName = fn
        lastName = ln
    }
}

var p = Person()
let changer = Person.changeName
changer(&p)("John", "Smith")
p.firstName
p.changeName(fn: "Adam", ln: "Gallagher")
p.firstName
