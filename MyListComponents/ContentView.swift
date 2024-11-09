//
//  ContentView.swift
//  MyListComponents
//
//  Created by Yuki Kuwashima on 2024/11/09.
//

import SwiftUI

struct ContentView: View {

    @State var review: Review = .star2

    var body: some View {
        NavigationStack {
            List {
                Section("Created by ゆるゆる") {
                    Text("これは普通のテキストです")
                }
                Section("Created by ゆるゆる") {
                    SimpleCard(
                        title: "カードです",
                        titleColor: .white,
                        backgroundColor: .blue
                    )
                }
                Section("Created by ゆるゆる") {
                    SimpleIconCard(
                        title: "アイコン付きカードです",
                        iconName: "photo",
                        foregroundColor: .white,
                        backgroundColor: .cyan
                    )
                }
                Section("Created by ゆるゆる") {
                    StarReview(review: $review, title: "面白さ")
                }
                Section("Created by ゆるゆる") {
                    YuruyuruView()
                }
            }
            .navigationTitle("MyComponents")
        }
    }
}

#Preview {
    ContentView()
}
