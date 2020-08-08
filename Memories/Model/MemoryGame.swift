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

        if let chosenIndex = cards.index(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
}
