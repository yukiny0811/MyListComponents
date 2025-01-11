//
//  newfileView.swift
//  MyListComponents
//
//  Created by 土屋暁 on 2025/01/11.
//
import SwiftUI

struct NewfileView: View{
    
    let spear: String
    let titleColor: Color
    
    var body: some View{
        ZStack{
            Color.white
                .ignoresSafeArea()
            VStack{
                Text(spear)
                    .font(.largeTitle)
                    .foregroundColor(titleColor)
                
                
            }
        }
        
    }
}

#Preview {
    List {
        Section {
            NewfileView(
                spear:"槍",
                titleColor:.purple
            )
        }
    }
}
