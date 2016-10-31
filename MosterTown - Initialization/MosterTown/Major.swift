//
//  Major.swift
//  MosterTown
//
//  Created by Sergiy Blednov on 9/29/16.
//  Copyright © 2016 Sergiy Blednov. All rights reserved.
//

import Foundation

struct Major {
    
    private var anxietyLevel: Int = 0 {
        didSet(newValue) {
            print("Anxiety Level is \(newValue)")
        }
    }
    
    mutating func promiseMessage() {
        print("I'm deeply saddened to hear about this latest ptagedy. I promise that my office is looking into the nature of this rash of violence")
        anxietyLevel += 1
    }
}
