//
//  ContentView.swift
//  test01
//
//  Created by Sang Hyun Kim on 2023/05/18.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["❤️","🩷","🧡","💛","💚","💙","🩵","💜","🖤","🩶","🤍","🤎","❤️‍🔥","❤️‍🩹","💔","❣️","💕","💞","💓","💗","💖","💘","💝"]
    @State var emojiCount = 4
    
    var add: some View{
        Button{
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }
        label:{
                Image(systemName: "plus.circle")
        }
    }
    
    var remove: some View{
        Button{
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }
        label:{
            Image(systemName: "minus.circle")
        }
    }
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid (columns:[GridItem(.adaptive(minimum: 65))]) {
                    //            HStack{
                    ForEach(emojis[0..<emojiCount], id:\.self) { emoji in CardView(content:emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(Color.red)
            Spacer(minLength: 20)
            HStack{
                remove
                Spacer(minLength: 20)
                add

            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
}
    

struct CardView: View{
    var content: String
    @State var isFaceUp : Bool = false
    
    var body: some View{
        ZStack{
            let shape :RoundedRectangle =  RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp {
                shape.foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else
            {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
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

