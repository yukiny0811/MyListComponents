//
//  StarReview.swift
//  MyListComponents
//
//  Created by Yuki Kuwashima on 2024/11/09.
//

import SwiftUI

enum Review: Int, Comparable {
    case star1 = 1
    case star2 = 2
    case star3 = 3
    case star4 = 4
    case star5 = 5

    static func < (lhs: Review, rhs: Review) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

struct StarReview: View {

    @Binding var review: Review
    let title: String

    init(review: Binding<Review>, title: String) {
        self._review = review
        self.title = title
    }

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Button {
                review = .star1
            } label: {
                Image(systemName: review >= .star1 ? "star.fill" : "star")
            }
            .buttonStyle(.plain)
            Button {
                review = .star2
            } label: {
                Image(systemName: review >= .star2 ? "star.fill" : "star")
            }
            .buttonStyle(.plain)
            Button {
                review = .star3
            } label: {
                Image(systemName: review >= .star3 ? "star.fill" : "star")
            }
            .buttonStyle(.plain)
            Button {
                review = .star4
            } label: {
                Image(systemName: review >= .star4 ? "star.fill" : "star")
            }
            .buttonStyle(.plain)
            Button {
                review = .star5
            } label: {
                Image(systemName: review >= .star5 ? "star.fill" : "star")
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    @Previewable @State var review: Review = .star2
    List {
        Section {
            StarReview(review: $review, title: "レビュー")
        }
    }
}
