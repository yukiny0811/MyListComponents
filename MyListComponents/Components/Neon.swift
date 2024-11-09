//
//  neonView.swift
//  MyListComponents
//
//  Created by Taira Enon on 2024/11/09.
//

import SwiftUI

struct NeonView: View {
    let title: String
    let iconName: String?
    let foregroundColor: Color
    let backgroundColor: Color
    
    init(
        title: String,
        iconName: String?,
        foregroundColor: Color,
        backgroundColor: Color
    ) {
        self.title = title
        self.iconName = iconName
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
    var body: some View {
        ZStack{
            Rectangle()
                .fill(backgroundColor)
            HStack{
                if let iconName {
                    Image(iconName)
                        .foregroundStyle(foregroundColor)
                        .frame(width: 100)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.fill")
                        .font(.system(size: 35))
                        .padding(10)
                        .foregroundStyle(foregroundColor)
                        .background(.gray)
                        .clipShape(Circle())
                }
                
                Text(title)
                    .foregroundStyle(foregroundColor)
                    .font(.title2)
                    .padding(50)
                    .bold()
                Spacer()
            }
            .padding(.horizontal, 30)
        }
        .listRowInsets(.init())
        .frame(height: 65)
    }
}

#Preview {
    List{
        Section{
            NeonView(
                title: "ねおん",
                iconName: nil,
                foregroundColor: .white,
                backgroundColor: .black
            )
        }
    }
    
}

