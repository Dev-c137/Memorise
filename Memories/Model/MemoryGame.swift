//
//  MemoryGame.swift
//  Memories
//
//  Created by Devang Pawar on 01/08/20.
//  Copyright © 2020 Devang Pawar. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: [Card]

    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter { cards[$0].isFaceUp }.only
        }

        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }

    var isSeenIndex = [Int]()

    var gameOver: Bool {
        cards.indices.filter{ cards[$0].isMatched }.count == cards.count
    }

    var score = 0

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards = cards.shuffled()
    }

    struct Card: Identifiable {
        var id: Int
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
    }
}

// MARK: - chosing card
extension MemoryGame {

    mutating func choose(card: Card) {
        //get chosen cards index ignore if already faceup and matched
        if let chosenIndex = cards.index(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            //if theres a one card already face up
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                //if both faceup cards match
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    //mismatch
                    if isSeenIndex.contains(chosenIndex) || isSeenIndex.contains(potentialMatchIndex) {
                        score -= 1
                    }
                    isSeenIndex.append(chosenIndex)
                    isSeenIndex.append(potentialMatchIndex)
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                //make this card faceup
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
}
