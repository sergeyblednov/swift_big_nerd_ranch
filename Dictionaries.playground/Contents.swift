//: Playground - noun: a place where people can play

import Cocoa

var movieRatings = ["Donnie Darko" : 4, "Chungking Express" : 5, "Dark City" : 4]
print("I have rated \(movieRatings.count) movies")
let darkoRating = movieRatings["Donnie Darko"]
movieRatings["Dark City"] = 5
movieRatings

let oldValue: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldValue, let currentRating = movieRatings["Donnie Darko"] {
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}
movieRatings["The Cabinet of Dr.Caligari"] = 5
//movieRatings.removeValue(forKey: "Dark City")
movieRatings["Dark City"] = nil

for (key, value) in movieRatings {
    print("The movie \(key) was rated \(value).")
}

for movie in movieRatings.keys {
    print("User has rated \(movie).")
}

let watchedMovies = Array(movieRatings.keys)

// Silver Challenge

var counties = [String : Array<Int>]()
counties["Morris"] = [30306, 30307, 30308]
counties["Essex"] = [30331, 30332, 30333]
counties["Union"] = [30341, 30342, 30343]
print(counties)
var codes = [Int]()
for (key, value) in counties {
    if let countyCodes = counties[key] {
        codes += countyCodes
    }
}
print("New Jersey has the following zip codes: \(codes)")

