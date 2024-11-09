//
//  SimpleCard.swift
//  MyListComponents
//
//  Created by Yuki Kuwashima on 2024/11/09.
//

import SwiftUI

struct SimpleCard: View {

    let title: String
    let titleColor: Color
    let backgroundColor: Color

    init(
        title: String,
        titleColor: Color,
        backgroundColor: Color
    ) {
        self.title = title
        self.titleColor = titleColor
        self.backgroundColor = backgroundColor
    }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(backgroundColor)
            Text(title)
                .foregroundStyle(titleColor)
        }
        .listRowInsets(.init())
    }
}

#Preview {
    List {
        Section {
            SimpleCard(
                title: "カードです",
                titleColor: .white,
                backgroundColor: .blue
            )
        }
    }
}
