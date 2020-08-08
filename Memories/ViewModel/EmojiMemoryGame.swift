//
//  EmojiMemoryGame.swift
//  Memories
//
//  Created by Devang Pawar on 01/08/20.
//  Copyright © 2020 Devang Pawar. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var emojiGame: MemoryGame<String>

    private(set) var theme = themes.randomElement()!

    init() {
        emojiGame = EmojiMemoryGame.createMemoryGame(using: theme)
    }

    static func createMemoryGame(using theme: EmojiTheme) -> MemoryGame<String> {
        let emojis = theme.emojis.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs) { (pairIndex) -> String in
            return emojis[pairIndex]
        }
    }

// MARK: - access to the model
    var cards: [MemoryGame<String>.Card] {
        emojiGame.cards
    }

    var score: Int {
        emojiGame.score
    }

    var gameOver: Bool {
        emojiGame.gameOver
    }
}

// MARK: - Intent
extension EmojiMemoryGame {
    func choose(card: MemoryGame<String>.Card) {
        emojiGame.choose(card: card)
    }

    func newGame() {
        theme = themes.randomElement()!
        emojiGame = EmojiMemoryGame.createMemoryGame(using: theme)
    }
}
