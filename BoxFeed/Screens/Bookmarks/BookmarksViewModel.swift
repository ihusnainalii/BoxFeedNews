//
//  BookmarksViewModel.swift
//  BoxFeed
//
//  Created by Husnain Ali on 18/03/24.
//

import Foundation
import CoreData
import SwiftUI

class BookmarksViewModel: ObservableObject {
    
    @Published var showArticle = false
    @Published var selectedArticle: ArticleCD? = nil
    
    init() {}
    
    func selectArticle(_ article: ArticleCD) {
        selectedArticle = article
        showArticle = true
    }
    
    func getNewsModel(_ article: ArticleCD) -> NewsModel {
        return NewsModel(
            id: Sources(rawValue: article.sourceId ?? ""),
            author: article.author,
            title: article.title,
            description: article.desc,
            url: URL(string: article.url ?? ""),
            urlToImage: URL(string: article.urlToImage ?? ""),
            publishedAt: article.publishedAt,
            content: article.content
        )
    }
    
    func removeBookmark(_ article: ArticleCD, _ moc: NSManagedObjectContext) {
        withAnimation {
            moc.delete(article)
            do {
                try moc.save()
            } catch { print(error.localizedDescription) }
        }
    }
}
