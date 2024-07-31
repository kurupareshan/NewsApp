//
//  NewsArticle.swift
//  NewsApp
//
//  Created by kurupareshan pathmanathan on 7/30/24.
//

import Foundation

struct NewsArticle: Identifiable, Decodable {
    let id = UUID()
    let title: String
    let source: Source
    let publishedAt: String
    let urlToImage: String?
    let content: String?
    
    enum CodingKeys: String, CodingKey {
        case title, source, publishedAt, urlToImage, content
    }
}

struct Source: Decodable {
    let name: String
}
