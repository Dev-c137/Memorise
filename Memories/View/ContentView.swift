//
//  ContentView.swift
//  Memories
//
//  Created by Devang Pawar on 01/08/20.
//  Copyright © 2020 Devang Pawar. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var emojiControl: EmojiMemoryGame

    var body: some View {
        HStack {//creates a horizontal stack
            ForEach(emojiControl.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        self.emojiControl.choose(card: card)
                }
            }
            //assignment 1 challenge 2 = give 2:3 aspect ratio
            .aspectRatio(0.75, contentMode: .fit)
        }
            .foregroundColor(.orange)//color of card
            .padding()//paddding so it wont go to the edges
            //assignment 1 challenge 5 = in 5 cards option choose different font
            .font(emojiControl.cards.count > 4 ? .body : .largeTitle)
    }
}

// MARK: - card view
struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)//create rounded rect with how much rounded edges
                    .fill(Color.white)//give it color white
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)// color it with width
                Text(card.content)//give it text
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill()
            }
        }
    }
}

// MARK: - preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojiControl: EmojiMemoryGame())
    }
}
