//
//  Concentration.swift
//  Concentration
//
//  Created by Daniel Vu on 3/1/18.
//  Copyright © 2018 vdaniel5. All rights reserved.
//

import Foundation

class Concentration
{
    //var cards = Array<Card>()
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyCard: Int? {//cases of not one card being set is simply not set. aka. no card to match up against, so no need to set
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp  {
                    guard foundIndex == nil else { return nil }
                    foundIndex = index
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyCard, matchIndex != index {
                //Check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyCard = index //this is the only card face up
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            /*
             //let matchingCard = card //assign struct creates a copy of it
             cards.append(card) //Add card to cards[] array
             //cards.append(matchingCard)
             cards.append(card) //Moving around a struct (eg. adding to array) makes a copy. still NOT a pointer
             */
            cards += [card, card] //same as commented out block
        }
        //TODO: Shuffle cards
        
    }
}
