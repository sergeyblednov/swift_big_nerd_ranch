//: Playground - noun: a place where people can play

import Cocoa

protocol ExerciseType: CustomStringConvertible {
    var name: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
    var title: String { get }
}

extension ExerciseType {
    var description: String {
        return "Exercise(\(name), burned \(caloriesBurned), calories in \(minutes) minutes)"
    }
}

struct EllipticalTrainer: ExerciseType {
    let name = "Elliptical Machine"
    let caloriesBurned: Double
    let minutes: Double
    let title = "Go Fast Elliptical Machine 3000"
}

struct Treadmill: ExerciseType {
    let name = "Treadmill"
    let caloriesBurned: Double
    let minutes: Double
    let distanceInMiles: Double
    let title = "Treadmill Model 50"
}

extension Treadmill {
    var description: String {
        return "Treadmill(\(caloriesBurned) calories and \(distanceInMiles) miles in \(minutes) minutes)"
    }
}

let ellipticalWorkout = EllipticalTrainer(caloriesBurned: 335, minutes: 30)
let runningWorkout = Treadmill(caloriesBurned: 350, minutes: 25, distanceInMiles: 4.2)

//func calloriesBurnedPerMinute<Exercise: ExerciseType>(exercise: Exercise) -> Double {
//    return exercise.caloriesBurned / exercise.minutes
//}

extension ExerciseType {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}

//print(calloriesBurnedPerMinute(exercise: ellipticalWorkout))
//print(calloriesBurnedPerMinute(exercise: runningWorkout))

print(ellipticalWorkout.caloriesBurnedPerMinute)
print(runningWorkout.caloriesBurnedPerMinute)

print(ellipticalWorkout)
print(runningWorkout)

extension Sequence where Iterator.Element == ExerciseType {
    func totlaCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout: [ExerciseType] = [ellipticalWorkout, runningWorkout]
print(mondayWorkout.totlaCaloriesBurned())

//Naming Things: A Cautionary Tale

extension ExerciseType {
    var title: String {
        return "\(name) - \(minutes) minutes"
    }
}

print("*************")

for exersice in mondayWorkout {
    print(exersice.title)
}

print(ellipticalWorkout.title)


