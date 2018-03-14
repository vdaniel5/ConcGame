//
//  Card.swift
//  Concentration
//
//  Created by Daniel Vu on 3/1/18.
//  Copyright © 2018 vdaniel5. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int { //utility function tied to the type
        identifierFactory += 1 //Do not need to specify type b/c static
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier() //Note: without stating type card, will not work
    }
}
