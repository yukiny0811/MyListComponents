//
//  hightView.swift
//  MyListComponents
//
//  Created by Rika Aota on 2024/11/09.
//

import SwiftUI

struct HeightView: View {

    let tate: CGFloat
    let backgroundColor: Color
    

    init(
        tate: CGFloat,
        backgroundColor: Color
    ) {
        self.tate = tate
        self.backgroundColor = backgroundColor
    }

    var body: some View {
        ZStack {
            Rectangle()
                .fill(backgroundColor)
                .frame(height: tate)
        }
        .listRowInsets(.init())
    }
}

#Preview {
    List {
        Section {
            HeightView(
                tate: 200,
                backgroundColor: .blue
            )
        }
    }
}
