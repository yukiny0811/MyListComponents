//
//  ContentView.swift
//  MyListComponents
//
//  Created by Yuki Kuwashima on 2024/11/09.
//

import SwiftUI
import UIKit

struct ContentView: View {

    @State var review: Review = .star2
    @State var isAlarmOn: Bool

    let sampleIcon = UIImage(systemName: "person.circle")!
    let samplePostImage = UIImage(systemName: "photo")!
    
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
                Section("Created by aki") {
                    SubjectView(title: "Hello world")
                }
                Section("Created by りさ") {
                    AccountManagementView(
                        title: "アカウントの管理",
                        subtitle: "アカウントの情報管理",
                        iconName: "person.fill",
                        titleColor: .white,
                        backgroundColor: .blue
                    )
                }
                Section("Created by りさ") {
                    HeightView(
                        tate: 100,
                        backgroundColor: .blue
                    )
                }
                Section("Created by りさ") {
                    TimelinePostView(
                        iconName: sampleIcon,
                        userID: "ぬ",
                        postDate: Date(),
                        posttext: "こんにちはあああ",
                        postImage: samplePostImage
                    )
                }
                Section("Created by りさ") {
                    PickView(
                        title: "Fruit Picker", options: ["Apple", "Banana", "Orange"]
                    )
                }
                Section("Created by りさ") {
                    AlarmRow(time: "0:44", label: "aa", isAlarmOn: $isAlarmOn)
                }
            }
            .navigationTitle("MyComponents")
        }
    }
}

#Preview {
    ContentView(isAlarmOn: Bool())
}
