//
//  TweetView.swift
//  MyListComponents
//
//  Created by Rika Aota on 2024/11/09.
//

import SwiftUI
import UIKit

struct TimelinePostView: View {
    let iconName: UIImage
    let userID: String
    let postDate: Date
    let posttext: String
    let postImage: UIImage?

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top, spacing: 12) {
                // Icon
                Image(uiImage: iconName)
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)

                VStack(alignment: .leading, spacing: 4) {
                    // Username and Date
                    HStack {
                        Text(userID)
                            .font(.headline)
                        Text(postDate, style: .date) // Format the Date for display
                            .font(.caption)
                            .foregroundColor(.gray)
                    }

                    // Post Content
                    Text(posttext)
                        .font(.body)
                        .lineLimit(nil)
                }
            }

            // Attached Image (if available)
            if let postImage = postImage {
                Image(uiImage: postImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .clipped()
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

#Preview {
    let sampleIcon = UIImage(systemName: "person.circle")!
    let samplePostImage = UIImage(systemName: "photo")!
    TimelinePostView(
        iconName: sampleIcon,
        userID: "ぬ",
        postDate: Date(),
        posttext: "こんにちはあああ",
        postImage: samplePostImage
    )
}
