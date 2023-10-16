//
//  ContentView.swift
//  MemoryGame
//
//  Created by Kacper Madejczyk on 16/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["🤣", "🥵", "🥶", "😈", "👍", "❤️", "🤓", "😎", "😼", "👽", "🎃", "🧠", "🫠", "🤗", "🥹", "🙃"]
    @State var cardCount = 4
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) {
                index in CardView(emojiIcon: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.blue)
    }
    
    var cardAdder: some View {
        Button("+") {
            if cardCount < emojis.count-1 {
                cardCount += 2
            }
        }
    }
    
    var cardRemover: some View {
        Button("-") {
            if cardCount > 2 {
                cardCount -= 2
            }
        }
    }
    
    var cardsCountAdjuster: some View {
        HStack {
            cardAdder
            Spacer()
            cardRemover
        }
    }
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            cardsCountAdjuster
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
