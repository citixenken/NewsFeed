//
//  ArticleView.swift
//  NewsFeed
//
//  Created by Ken Muyesu on 29/04/2022.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    let article: Article
    
    var body: some View {
        HStack {
            if let imageURL = article.image,
            let url = URL(string: imageURL) {
                
                URLImage(url) {
                    // This view is displayed before download starts
                        EmptyView()
                    } inProgress: { progress in
                        // Display progress
                        Text("Loading...")
                    } failure: { error, _ in
//                         Display error and retry button
                        PlaceholderImageView()
                } content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                }
                .frame(width: 120, height: 120)
                .cornerRadius(16)
                .environment(\.urlImageOptions, URLImageOptions(maxPixelSize: CGSize(width: 600.0, height: 600.0)
                ))
                
            } else {
                PlaceholderImageView()
            }
            
            VStack (alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(.primary)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "")
                    .foregroundColor(.secondary)
                    .font(.footnote)
            }
        }
    }
}

struct PlaceholderImageView: View {
    var body: some View {
        VStack {
            Image(systemName: "photo.fill")
                .foregroundColor(.white)
                .background(Color.gray)
                .frame(width: 100, height: 100)
    }
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
    }
}
