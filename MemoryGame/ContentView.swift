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
    
    var cardDisplay: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) {
                index in CardView(emojiIcon: emojis[index])
                    .aspectRatio(4, contentMode: .fit)
            }
        }
        .foregroundColor(.blue)
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        Button(symbol) {
            if(offset < 0 && cardCount >= 2) {
                cardCount -= 2
            } else if (offset > 0 && cardCount <= emojis.count-2){
                cardCount += 2
            }
        }
        .disabled((offset < 0 && cardCount <= 0) || (offset > 0 && cardCount >= emojis.count))
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        .frame(minWidth: 45, minHeight: 35)
        .border(.blue, width: 2)
        .cornerRadius(5)
    }
    
    var cardAdder: some View {
        adjustCardNumber(by: 2, symbol: "+")
    }
    
    var cardRemover: some View {
        adjustCardNumber(by: -2, symbol: "-")
    }
    
    var cardsCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
    }
    
    var body: some View {
        VStack {
            ScrollView {
                cardDisplay
            }
            cardsCountAdjuster
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
