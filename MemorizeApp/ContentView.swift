//
//  ContentView.swift
//  MemorizeApp
//
//  Created by Bogdan Costea on 12.11.2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚕", "🚒", "🚔", "🛵", "🚑", "🚁", "✈️", "🚂", "🚀", "🚛", "🏎", "🛺", "⚽️", "🏀", "🎾", "🏉"]
    @State var emojiCount = 16
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))], spacing: 10) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(isFaceUp: false, content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.bottom)
            .font(.largeTitle)
        }
        .padding([.top, .horizontal])
    }
    
    var remove: some View {
        Button {
            if emojiCount > 0 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}


struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            let symbol = Text(content).font(.largeTitle)
            if isFaceUp {
                shape
                    .foregroundColor(.white)
                symbol
                shape
                    .strokeBorder(lineWidth: 6)
                    .foregroundColor(.red)
            } else {
                symbol
                shape
                    .foregroundColor(.red)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
