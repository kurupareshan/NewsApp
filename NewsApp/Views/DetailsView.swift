//
//  DetailsView.swift
//  NewsApp
//
//  Created by kurupareshan pathmanathan on 7/30/24.
//

import SwiftUI

struct DetailsView: View {
    
    let article: NewsArticle
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(alignment: .center) {
                    ImageDisplayView(url: URL(string: article.urlToImage ?? ""), isCircular: false, height: geometry.size.height * 0.3, width: geometry.size.width * 0.9)
                        .frame(width: geometry.size.width * 0.9)
                    
                    Text(article.title)
                        .font(.title)
                        .padding(.top, 10)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text(article.source.name)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text(article.publishedAt)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text(article.content ?? "")
                        .font(.body)
                        .padding(.top, 10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .navigationTitle("Article Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleArticle = NewsArticle(
            title: "Sample Title",
            source: Source(name: "Sample Source"),
            publishedAt: "2024-07-30",
            urlToImage: "https://via.placeholder.com/150",
            content: "This is a sample article content for preview purposes."
        )
        
        DetailsView(article: sampleArticle)
    }
}
