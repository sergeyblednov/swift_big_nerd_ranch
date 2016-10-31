//: Playground - noun: a place where people can play

import Cocoa

var busketList = ["Climb Mt.Everest"]
var newItems = ["Fly to aur ballon to Fuji",
                "Watch the Lord of the Rings",
                "Go to a walkabout",
                "Scuba dive in the Great Blue Hole",
                "Find a triple rainbow"]
busketList += newItems
busketList.count
busketList.remove(at: 2)
print(busketList.count)
print(busketList[0...2])
busketList[2] += " in Australia"
print(busketList[2])
busketList[0] = "Climb Mt.Kilimanjaro"
busketList.insert("Toboggan accross Alaska", at: 2)
print(busketList)

var myronsList = ["Climb Mt.Kilimanjaro",
                  "Fly to aur ballon to Fuji",
                  "Toboggan accross Alaska",
                  "Go to a walkabout in Australia",
                  "Scuba dive in the Great Blue Hole",
                  "Find a triple rainbow"]
let equal = busketList == myronsList
let lunches = ["Cheesburger",
               "Veggie Pizza",
               "Chicken Caesar Salad",
               "Black Bean Burrito",
               "Falafel wrap"]

var toDoList = ["Take out garbage", "Pay bills", "Take a bike", "Cross off finished items", "Run"]
//Bronze
var empty = toDoList.isEmpty
//Silver
print(toDoList)
//var i = 0
//while i < (toDoList.count - 1) {
//    let item = toDoList.remove(at: 0)
//    toDoList.insert(item, at:toDoList.count - i)
//    i += 1
//}

for i in 0..<toDoList.count {
    let item = toDoList.remove(at: 0)
    toDoList.insert(item, at:toDoList.count - i)
}

print(toDoList)
let reversedList = Array(toDoList.reversed())
print(reversedList)
