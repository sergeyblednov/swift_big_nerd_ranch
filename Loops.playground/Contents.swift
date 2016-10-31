
import Cocoa

//var shields = 5
//var blasterOverheating = false
//var blasterFireCount = 0
//var spaceDemonsDestroyed = 0
//while shields > 0 {
//    
//    if spaceDemonsDestroyed == 50 {
//        print("You beat the game!")
//        break
//    }
//    
//    if blasterOverheating {
//        print("Blasters overheating.! Cooldown initiated.")
//        sleep(5)
//        print("Blaster ready to fire")
//        sleep(1)
//        blasterOverheating = false
//        blasterFireCount = 0
//        
//    }
//    
//    if blasterFireCount > 10 {
//        blasterOverheating = true
//        continue
//    }
//    
//    print("Fire blasters")
//    blasterFireCount += 1
//    spaceDemonsDestroyed += 1
//}

var counter = 0
for case let i in 0...100 where i % 2 == 0 {
    if counter == 5 {
        break
    }
    print("counter \(counter) for i = \(i)")
    counter += 1
    
}

