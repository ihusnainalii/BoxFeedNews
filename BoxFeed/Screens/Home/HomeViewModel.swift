//
//  HomeViewModel.swift
//  BoxFeed
//
//  Created by Husnain Ali on 07/04/24.
//

import SwiftUI
import CoreData

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var selection: Sources = .bbcNews {
        didSet {
            print("selection: \(selection.rawValue)")
            news.removeAll()
            currentPage = 1
        }
    }
    
    @Published var currentPage = 1 {
        didSet {
            print("currentPage: \(currentPage)")
            Task {
                await fetchNews()
            }
        }
    }
    
    @Published private(set) var news = [NewsModel]()
    @Published var openBookmarks = false
    @Published var showArticle = false
    @Published var selectedArticle: NewsModel? = nil
    
    private let service: NewsService
    
    var lastObject: NewsModel {
        news[news.endIndex - 1]
    }
    
    init(service: NewsService = NewsService()) {
        self.service = service
        Task {
            await fetchNews()
        }
    }
    
    func fetchNews() async {
        if let articles = try? await service.fetchNews(from: selection, page: currentPage) {
            withAnimation {
                self.news += articles
            }
        }
    }
    
    func loadNews(with artical: NewsModel) {
        selectedArticle = artical
        showArticle = true
    }
    
    func isBookmarked(_ model: NewsModel, _ articles: FetchedResults<ArticleCD>) -> Bool {
        for article in articles {
            if article.url == model.url?.absoluteString {
                return true
            }
        }
        return false
    }
    
    func bookmarkArticle(
        _ model: NewsModel, _ articles: FetchedResults<ArticleCD>,
        _ moc: NSManagedObjectContext
    ) {
        for article in articles {
            if article.url == model.url?.absoluteString {
                removeBookmark(article, moc)
                return
            }
        }
        addBookmark(model, moc)
    }
    
    func addBookmark(_ article: NewsModel, _ moc: NSManagedObjectContext) {
        let model = ArticleCD(context: moc)
        model.id = UUID()
        model.createdAt = Date()
        model.sourceId = article.id?.rawValue
        model.author = article.author
        model.content = article.content
        model.desc = article.description
        model.publishedAt = article.publishedAt
        model.title = article.title
        model.url = article.url?.absoluteString
        model.urlToImage = article.urlToImage?.absoluteString
        do { try moc.save() }
        catch { print(error.localizedDescription) }
    }
    
    func removeBookmark(_ article: ArticleCD, _ moc: NSManagedObjectContext) {
        moc.delete(article)
        do {
            try moc.save()
        } catch { print(error.localizedDescription) }
    }
}
