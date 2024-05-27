//
//  NewsService.swift
//  BoxFeed
//
//  Created by Husnain Ali on 17/03/24.
//

import Foundation


final class NewsService {
    
    struct Constants {
        static let scheme = "https"
        static let host = "newsapi.org"
    }
    
    enum Endpoints {
        
        case fetchNews(source: SourceModel?, date: String, page: Int)
        case fetchSoruce
        case topHeadlines
        
        var url: URL? {
            var urlComponents = URLComponents()
            urlComponents.scheme = Constants.scheme
            urlComponents.host = Constants.host
            let currentLocale = Locale.current
            
            // Common query parameters
            var queryItems: [URLQueryItem] = [
                URLQueryItem(name: "apiKey", value: AppConfig.API_KEY),
                URLQueryItem(name: "language", value: currentLocale.deviceLanguageIfSupported)
            ]
            
            switch self {
            case .fetchNews(let source, let date, let page):
                urlComponents.path = "/v2/everything"
                queryItems.append(contentsOf: [
                    URLQueryItem(name: "q", value: source?.id),
                    URLQueryItem(name: "to", value: date),
                    URLQueryItem(name: "sortBy", value: "publishedAt"),
                    URLQueryItem(name: "page", value: String(page)),
                    URLQueryItem(name: "pageSize", value: String(100)),
                ])
            case .fetchSoruce:
                urlComponents.path = "/v2/top-headlines/sources"
            case .topHeadlines:
                urlComponents.path = "/v2/top-headlines"
                queryItems.append(contentsOf: [
                    URLQueryItem(name: "country", value: currentLocale.countryIfSupported)
                ])
            }
            
            urlComponents.queryItems = queryItems
            return urlComponents.url
        }
    }
    
    private func getListURL(with endpoints: Endpoints) -> URL? {
        endpoints.url
    }
    
    lazy private var currentDate: String = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }()
    
    func fetchNews(from source: SourceModel, page: Int) async throws -> [NewsModel]? {
        guard let url = getListURL(with: .fetchNews(source: source, date: currentDate, page: page)) else { return nil }
        print("Fetch News URL: \(url)")
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
        guard let url = getListURL(with: .fetchSoruce) else { return nil }
        print("Fetch Sources URL: \(url)")
        let (data, _) = try await URLSession.shared.data(from: url)
        if let model = try? JSONDecoder().decode(SourceDataModel.self, from: data) {
            return model.sources
        }
        return []
    }
    
    func fetchTopHeadlines() async throws -> [NewsModel]? {
        guard let url = getListURL(with: .topHeadlines) else { return nil }
        print("Top Headlines URL: \(url)")
        let (data, _) = try await URLSession.shared.data(from: url)
        if let model = try? JSONDecoder().decode(NewsDataModel.self, from: data) {
            return model.articles
        }
        return []
    }
}
