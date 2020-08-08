//
//  EmojiTheme.swift
//  Memories
//
//  Created by Devang Pawar on 08/08/20.
//  Copyright © 2020 Devang Pawar. All rights reserved.
//

import SwiftUI

struct EmojiTheme {
    let name: String
    let emojis: [String]
    let numberOfPairs: Int
    let color: Color
    let gradient: Gradient
}

let themes = [haloween, smily, food, balls, hearts, flags]

let haloween = EmojiTheme(name: "Haloween",
                     emojis: "👻 🎃 🕷 🧛🏻‍♂️ 🧙🏻 💣 🔮 🕸 🧟‍♀️ 🧟‍♂️ 🧝🏻‍♂️ 🧙🏻‍♂️ 👁".components(separatedBy: " "),
                     numberOfPairs: 4,
                     color: .orange,
                     gradient:  Gradient(colors: [.orange, .black, .red])
)
let smily = EmojiTheme(name: "Smily",
                  emojis: "😉 😘 😍 🥳 🤡 👽 😝 😋 🤪 😊".components(separatedBy: " "),
                     numberOfPairs: 4,
                     color: .blue,
                     gradient: Gradient(colors: [.blue, .white, .pink])
)
let food = EmojiTheme(name: "Food",
                 emojis: "🍎 🍉 🍑 🥑 🌽 🍆 🍠 🍖 🍗 🍔".components(separatedBy: " "),
                 numberOfPairs: Int.random(in: 3...6),
                 color: .green,
                 gradient: Gradient(colors: [.green, .white, .blue])
)
let balls = EmojiTheme(name: "Balls",
                  emojis: "⚽️ 🏀 ⚾️ 🥎 🎾 🏐 🎱".components(separatedBy: " "),
                  numberOfPairs: Int.random(in: 3...6),
                  color: .yellow,
                  gradient: Gradient(colors: [.yellow, .white, .pink])
)
let hearts = EmojiTheme(name: "Hearts",
                   emojis: "❤️ 💚 💙 💜 💛 🤍 🖤 💖 💗 💝".components(separatedBy: " "),
                     numberOfPairs: 10,
                     color: .red,
                     gradient: Gradient(colors: [.red, .black, .purple])
)
let flags = EmojiTheme(name: "Flags",
                  emojis: "🏳️ 🏴 🏴‍☠️ 🚩 🏳️‍🌈".components(separatedBy: " "),
                     numberOfPairs: Int.random(in: 3...4),
                     color: .pink,
                     gradient: Gradient(colors: [.pink, .white, .purple])
)
