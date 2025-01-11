//
//  checkworklisaView.swift
//  MyListComponents
//
//  Created by Rika Aota on 2025/01/11.
//

import SwiftUI

struct CheckworklisaView: View {
    var backgroundColor: Color
    
    @State private var inputText: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack(alignment: .leading) {
                if inputText.isEmpty {
                    Text("ここにテキストが表示されます　")
                        .foregroundColor(.gray)
                        .padding(10)
                        .opacity(0.7)
                }
                
                Text(inputText)
                    .font(.title)
                    .padding(10)
            }
            .background(Color.white)
            .cornerRadius(8)
            .padding()
            
            TextField("テキストを入力", text: $inputText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.default)
            
            Spacer()
        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(10)
        .shadow(radius: 5)
        .listRowInsets(.init())
    }
}

#Preview {
    List {
        Section {
            CheckworklisaView(
                backgroundColor: .blue
            )
        }
    }
}
