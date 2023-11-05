//
//  Cardify.swift
//  test01
//
//  Created by Sang Hyun Kim on 2023/11/05.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack{
            let shape :RoundedRectangle =  RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: DrawingConstants.lineWidth)
                
            }
            else
            {
                shape.fill()
            }
            content
                .opacity(isFaceUp ? 1 : 0)
        }
    }
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 3
        static let lineWidth: CGFloat = 2
    }
}

extension View {
    func cardify(isFaceUp: Bool ) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
