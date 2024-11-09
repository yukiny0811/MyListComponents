//
//  OickView.swift
//  MyListComponents
//
//  Created by Rika Aota on 2024/11/09.
//

import SwiftUI

struct PickView: View {
    let title: String
    let options: [String]

    @State private var selectedOption = ""

    var body: some View {
        Picker("Select Option", selection: $selectedOption) {
            ForEach(options, id: \.self) { option in
                Text(option)
            }
        }
        .pickerStyle(.menu)
    }
}

#Preview {
    List {
        Section {
            PickView(title: "Fruit Picker", options: ["Apple", "Banana", "Orange"])
        }
    }
}
