//
//  EmojiMemoryGameView.swift
//  Memories
//
//  Created by Devang Pawar on 01/08/20.
//  Copyright © 2020 Devang Pawar. All rights reserved.
//

import SwiftUI


struct EmojiMemoryGameView: View {
    @ObservedObject var emojiControl: EmojiMemoryGame

    var body: some View {

        VStack {
            Text("\(emojiControl.theme.name) with Score: \(emojiControl.score)")
            Grid(emojiControl.cards) { card in
                CardView(card: card, gradient: self.emojiControl.theme.gradient)
                    .onTapGesture {
                        self.emojiControl.choose(card: card)
                }
                .padding(5)
            }
            .padding()
            Button("New Game") {
                self.emojiControl.newGame()
            }
        }
        .background(Color.black)
        .foregroundColor(emojiControl.theme.color)

    }
}

// MARK: - card view
struct CardView: View {
    var card: MemoryGame<String>.Card

    var gradient: Gradient

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
                }
            }
        }
        .font(.system(size: fontSize(for: size)))
    }
    // MARK: - drawing constants
    let cornerRadius: CGFloat = 10
    let edgeWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75 
    }
}

// MARK: - preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(emojiControl: EmojiMemoryGame())
    }
}
