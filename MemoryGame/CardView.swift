//
//  CardView.swift
//  MemoryGame
//
//  Created by Kacper Madejczyk on 16/10/2023.
//

import SwiftUI

struct CardView: View {
    let emojiIcon: String
    @State var isFlipped = true
    var body: some View {
        ZStack {
            let memoCard = RoundedRectangle(cornerRadius: 12)
            Group {
                memoCard.fill(Color.white)
                memoCard.strokeBorder(lineWidth: 2)
                Text(emojiIcon).font(.largeTitle)
            }
            .opacity(isFlipped ? 1 : 0)
            memoCard.fill().opacity(isFlipped ? 0 : 1)
        }
        .onTapGesture {
            isFlipped = !isFlipped
        }
    }
}

#Preview {
    CardView(emojiIcon: "😀")
}
