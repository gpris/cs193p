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
        AspectVGrid(items: game.cards, aspectRatio: 2/3){ card in
            if card.isMatched && !card.isFaceUp {
                Rectangle().opacity(0)
            } else {
                CardView(card: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
                }
            }
            .foregroundColor(Color.red)
            .padding(.horizontal)
    }
}

    
struct CardView: View{
    let card: EmojiMemoryGame.Card
    
    var body: some View{
        ZStack{
            let shape :RoundedRectangle =  RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 350-90))
                    .padding(5).opacity(0.5)
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
    
    private func font(in size: CGSize) -> Font {
        Font.system(size:min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 2
        static let fontScale: CGFloat = 0.65
    }
}

        
        
        
        
        
        
        
        
        
        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
//        EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.dark)
//        EmojiMemoryGameView(game: game)
//            .preferredColorScheme(.light)
    }
}


