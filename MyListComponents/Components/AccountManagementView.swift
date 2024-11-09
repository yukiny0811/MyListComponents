//
//  tweet.swift
//  MyListComponents
//
//  Created by Rika Aota on 2024/11/09.
//

import SwiftUI

struct AccountManagementView: View {
    var title: String
    var subtitle: String
    var iconName: String
    var titleColor: Color
    var backgroundColor: Color

    var body: some View {
        ZStack {
            Rectangle()
                .fill(backgroundColor)
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(.white)
                    .imageScale(.large)
                    .padding(.trailing, 10)

                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .bold()
                        .foregroundColor(titleColor)
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding(20)
        }
        .listRowInsets(.init())
    }
}

#Preview {
    List {
        Section {
            AccountManagementView(
                title: "アカウントの管理",
                subtitle: "アカウントの情報管理",
                iconName: "person.fill",
                titleColor: .white,
                backgroundColor: .blue
            )
        }
    }
}
