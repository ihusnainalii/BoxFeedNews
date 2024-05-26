//
//  NewsService.swift
//  BoxFeed
//
//  Created by Husnain Ali on 17/03/24.
//

import Foundation


final class NewsService {
    
    lazy private var currentDate: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }()
    
    func fetchNews(from source: Sources, page: Int) async throws -> [NewsModel]? {
        let urlString = "https://newsapi.org/v2/everything?q=\(source.rawValue)&to=\(currentDate)&sortBy=publishedAt&apiKey=\(AppConfig.API_KEY)&page=\(page)"
        print("urlString \(urlString)")
        guard let url = URL(string: urlString) else { return nil }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        if var model = try? JSONDecoder().decode(NewsDataModel.self, from: data) {
            for i in 0..<(model.articles?.count ?? 0) {
                model.articles?[i].id = source
            }
            return model.articles
        }
        return []
    }
}
