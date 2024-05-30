//
//  NewsService.swift
//  BoxFeed
//
//  Created by Husnain Ali on 17/03/24.
//

import Foundation

protocol NetworkService {
    func fetchNews(from source: SourceModel, page: Int) async throws -> [NewsModel]?
    func fetchSources() async throws -> [SourceModel]?
    func fetchTopHeadlines() async throws -> [NewsModel]?
}

final class NewsService: NetworkService {
    
    lazy private var currentDate: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }()
    
    func fetchNews(from source: SourceModel, page: Int) async throws -> [NewsModel]? {
        guard let url = Endpoints.fetchNews(source: source, date: currentDate, page: page).url else { return nil }
        let (data, _) = try await URLSession.shared.data(from: url)
        if var model = try? JSONDecoder().decode(NewsDataModel.self, from: data) {
            for i in 0..<(model.articles?.count ?? 0) {
                model.articles?[i].id = source
            }
            return model.articles
        }
        return []
    }
    
    func fetchSources() async throws -> [SourceModel]? {
        guard let url = Endpoints.fetchSoruce.url else { return nil }
        let (data, _) = try await URLSession.shared.data(from: url)
        if let model = try? JSONDecoder().decode(SourceDataModel.self, from: data) {
            return model.sources
        }
        return []
    }
    
    func fetchTopHeadlines() async throws -> [NewsModel]? {
        guard let url = Endpoints.topHeadlines.url else { return nil }
        let (data, _) = try await URLSession.shared.data(from: url)
        if let model = try? JSONDecoder().decode(NewsDataModel.self, from: data) {
            return model.articles
        }
        return []
    }
}
