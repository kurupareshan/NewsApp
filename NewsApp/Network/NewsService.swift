//
//  NewsService.swift
//  NewsApp
//
//  Created by kurupareshan pathmanathan on 7/30/24.
//

import Foundation
import Alamofire
import Combine

class NewsService: ObservableObject {
    @Published var articles = [NewsArticle]()
    @Published var errorMessage: String?
    
    func fetchNews() {
        let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=bca0176b96b24ecb96eb7d72b67f7c85"
        
        AF.request(url).responseDecodable(of: NewsData.self) { response in
            switch response.result {
            case .success(let newsResponse):
                DispatchQueue.main.async {
                    self.articles = newsResponse.articles
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
