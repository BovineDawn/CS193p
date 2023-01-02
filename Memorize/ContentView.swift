//
//  ContentView.swift
//  Memorize
//
//  Created by JG on 12/26/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚀", "✈️", "🛻", "🛥️", "🚗", "🚙", "🚕", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🚚", "🏍️", "🛺", "🚲", "🛸", "🚁", "🚢", "⛰️", "🏣", "🏢"]
    @State var emojiCount = 20
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .foregroundColor(.purple)
            Spacer()
            HStack {
                add
                Spacer()
                remove
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
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
    var remove: some View {
        Button  {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle") }
    }
    
    struct CardView: View {
        var content: String
        @State var isFaceUp: Bool = true
        var body: some View {
            return ZStack(content: {
                let shape = RoundedRectangle(cornerRadius: 23.0)
                if isFaceUp {
                    shape
                        .fill()
                        .foregroundColor(.white)
                    shape
                        .strokeBorder(lineWidth: 2.5)
                    Text(content)
                        .font(.largeTitle)
                    
                }
                else {
                    shape
                        .fill()
                }
            })
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
