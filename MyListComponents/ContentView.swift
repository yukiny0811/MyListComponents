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
                Section {
                    Text("これは普通のテキストです")
                }
                Section {
                    SimpleCard(
                        title: "カードです",
                        titleColor: .white,
                        backgroundColor: .blue
                    )
                }
                Section {
                    SimpleIconCard(
                        title: "アイコン付きカードです",
                        iconName: "photo",
                        foregroundColor: .white,
                        backgroundColor: .cyan
                    )
                }
                Section {
                    StarReview(review: $review, title: "面白さ")
                }
            }
            .navigationTitle("MyComponents")
        }
    }
}

#Preview {
    ContentView()
}
