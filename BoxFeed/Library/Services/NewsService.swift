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
    
    func fetchNews(_ id: Sources) async throws -> [NewsModel]? {
        
        // Adjust the below URL date(from) depending on your API plan
        // For free tires, there's a limit from which date they can request
        let urlString = "https://newsapi.org/v2/everything?q=\(id)&to=\(currentDate)&sortBy=publishedAt&apiKey=\(AppConfig.API_KEY)"
        print("Request for url: \(urlString)")
        guard let url = URL(string: urlString) else { return nil }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        if var model = try? JSONDecoder().decode(NewsDataModel.self, from: data) {
            for i in 0..<(model.articles?.count ?? 0) {
                model.articles?[i].id = id
            }
            return model.articles
        }
        return []
    }
}
