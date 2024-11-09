//
//  SimpleIconCard.swift
//  MyListComponents
//
//  Created by Yuki Kuwashima on 2024/11/09.
//

import SwiftUI

struct SimpleIconCard: View {

    let title: String
    let iconName: String
    let foregroundColor: Color
    let backgroundColor: Color

    init(
        title: String,
        iconName: String,
        foregroundColor: Color,
        backgroundColor: Color
    ) {
        self.title = title
        self.iconName = iconName
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(backgroundColor)
            HStack {
                Image(systemName: iconName)
                    .foregroundStyle(foregroundColor)
                Text(title)
                    .foregroundStyle(foregroundColor)
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .listRowInsets(.init())
    }
}

#Preview {
    List {
        Section {
            SimpleIconCard(
                title: "アイコン付きカードです",
                iconName: "photo",
                foregroundColor: .white,
                backgroundColor: .cyan
            )
        }
    }
}
