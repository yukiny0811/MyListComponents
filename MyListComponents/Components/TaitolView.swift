//
//  aki.swift
//  MyListComponents
//
//  Created by 土屋暁 on 2024/11/09.
//

import SwiftUI

struct TaitolView: View {
    
    var radius: CGFloat = 40
    var width: CGFloat = 30
    var color: Color = .mint.opacity(0.5)
    
    let title: String
    
    init(
        title: String
    ) {
        self.title = title
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue)
            Text(title)
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(Color.white)
                .lineLimit(8)
                .multilineTextAlignment(.center)
                .padding(60.0)
                .background(Color.blue)
        }
        .listRowInsets(.init())
    }
}

#Preview {
    List {
        Section {
            TaitolView(
                title: "タイトル"
            )
           
        }
    }
}
