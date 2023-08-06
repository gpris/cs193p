//
//  MemorizeApp.swift
//  test01
//
//  Created by Sang Hyun Kim on 2023/05/18.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}

