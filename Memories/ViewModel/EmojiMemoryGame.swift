//
//  EmojiMemoryGame.swift
//  Memories
//
//  Created by Devang Pawar on 01/08/20.
//  Copyright © 2020 Devang Pawar. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var emojiGame: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    static var count = 0

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷", "🧛🏻‍♂️", "🧙🏻", "💣", "🔮", "🕸", "🧟‍♀️", "🧟‍♂️", "🧝🏻‍♂️", "🧙🏻‍♂️", "👁"].shuffled()// assignment 1 Extra credit challege = shuffle emojies to use
        //assignment 1 challege 4 = choose random pair of cards between 2 - 5
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { (pairIndex) -> String in
            return emojis[pairIndex]
        }
    }

// MARK: - access to the model
    var cards: [MemoryGame<String>.Card] {
        emojiGame.cards
    }
}

// MARK: - Intent
extension EmojiMemoryGame {
    func choose(card: MemoryGame<String>.Card) {
        emojiGame.choose(card: card)
    }
}
