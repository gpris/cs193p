//
//  EmojiMemoryGameView.swift
//  test01
//
//  Created by Sang Hyun Kim on 2023/05/18.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid (columns:[GridItem(.adaptive(minimum: 65))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(Color.red)
            .padding(.horizontal)
        }
        
    }
}

    
struct CardView: View{
    let card: EmojiMemoryGame.Card
    
    var body: some View{
        ZStack{
            let shape :RoundedRectangle =  RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceUp {
                shape.foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            }
            else if card.isMatched {
                shape.opacity(0) // transparent
            }
            else
            {
                shape.fill()
            }
        }
    }
}

        
        
        
        
        
        
        
        
        
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}


