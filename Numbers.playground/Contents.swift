
import Cocoa

print("The max Int value is \(Int.max)")
print("The min Int value is \(Int.min)")

print("The max UInt value is \(UInt.max)")
print("The min UInt value is \(UInt.min)")

print("The max 32-bit Int value is \(Int32.max)")
print("The min 32-bit Int value is \(Int32.min)")

print(11 / 3)
print(11 % 3)
print(-11 % 3)

let y: Int8 = 120
let z = Int16(y) + 10


let d1 = 1.1
let d2: Double = 1.1
let f1: Float = 100.3

print(10.0 + 10.4)
print(11.3 / 3.0)
print(12.4 % 5.0)

if d1 == d2 {
    print("d1 and d2 are the same!")
}

print("d1 + 0.1 is \(d1 + 0.1)")
if d1 + 0.1 == 1.2 {
    print("d1 + 0.1 is equal 1.2")
}