//
//  ContentView.swift
//  MyListComponents
//
//  Created by Yuki Kuwashima on 2024/11/09.
//

import SwiftUI

struct ContentView: View {
    
    @State var review: Review = .star2
    @State var isAlarmOn: Bool
    
    var body: some View {
        NavigationStack {
            List {
                Section("Created by aki"){
                    TaitolView(title: "タイトル")
                }
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
                Section("Created by りさ"){
                    AccountManagementView(
                        title: "アカウントの管理",
                        subtitle: "アカウントの情報管理",
                        iconName: "person.fill",
                        titleColor: .white,
                        backgroundColor: .blue
                    )
                }
                Section("Created by りさ"){
                    HeightView(
                        tate: 100,
                        backgroundColor: .blue
                    )
                }
                Section("Created by りさ"){
                    AlarmRow(time: "0:44", label: "aa", isAlarmOn: $isAlarmOn)
                }
                Section("Created by ねおん") {
                    NeonView(
                        title: "ねおん",
                        iconName: nil,
                        foregroundColor: .black,
                        backgroundColor: .white
                    )
                }
            }
            .navigationTitle("MyComponents")
        }
    }
}

#Preview {
    ContentView(isAlarmOn: Bool())
}
