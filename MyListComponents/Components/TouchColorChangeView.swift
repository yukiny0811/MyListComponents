//
//  TouchColorChangeView.swift
//  MyListComponents
//
//  Created by Yuki Kuwashima on 2025/01/11.
//

import SwiftUI

struct TouchColorChangeView: View {
    
    @State var currentColor: Color = .yellow
    
    let colors: [Color] = [
        Color.black,
        Color.blue,
        Color.red,
        Color.yellow,
        Color.cyan,
        Color.pink,
        Color.green,
        Color.mint,
        Color.purple,
        Color.brown,
        Color.orange,
        Color.indigo,
    ]
    
    var body: some View {
        currentColor
            .listRowInsets(.init())
            .onTapGesture {
                currentColor = colors.randomElement()!
            }
    }
}
