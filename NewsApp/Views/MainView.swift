//
//  MainView.swift
//  NewsApp
//
//  Created by kurupareshan pathmanathan on 7/30/24.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var newsService = NewsService()
    @AppStorage("isDarkMode") private var isDarkMode = false
    @State private var searchText = ""
    @State private var showAlert = false
    
    var filteredArticles: [NewsArticle] {
        if searchText.isEmpty {
            return newsService.articles
        } else {
            return newsService.articles.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(filteredArticles) { article in
                        NavigationLink(destination: DetailsView(article: article)) {
                            HStack(alignment: .top, spacing: 20) {
                                ImageDisplayView(url: URL(string: article.urlToImage ?? ""), isCircular: true, height: 60, width: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                VStack(alignment: .leading, spacing: 15) {
                                    Text(article.title)
                                        .font(.headline)
                                    Text(article.source.name)
                                        .font(.subheadline)
                                    Text(article.publishedAt)
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            .padding(.vertical, 10)
                        }
                        .background(Color.clear)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        
                        if article.id != filteredArticles.last?.id {
                            Divider()
                                .background(Color.gray)
                                .padding(.horizontal)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("News")
                .navigationBarTitleDisplayMode(.inline)
                .searchable(text: $searchText)
                .refreshable {
                    newsService.fetchNews()
                }
                .onAppear {
                    if newsService.articles.isEmpty {
                        newsService.fetchNews()
                    }
                }
                .toolbar {
                    Toggle(isOn: $isDarkMode) {
                        Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .toggleStyle(SwitchToggleStyle())
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(newsService.errorMessage ?? "Unknown error"), dismissButton: .default(Text("OK")))
                }
            }
            .onChange(of: newsService.errorMessage) { _ in
                showAlert = newsService.errorMessage != nil
            }
            .background(isDarkMode ? Color.black : Color.white)
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
        .environment(\.horizontalSizeClass, .compact)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
