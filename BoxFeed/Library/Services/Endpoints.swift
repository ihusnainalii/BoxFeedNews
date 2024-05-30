//
//  Endpoints.swift
//  BoxFeed
//
//  Created by Husnain Ali - ILI on 30/05/2024.
//

import Foundation

enum Endpoints {
    
    struct Constants {
        static let scheme = "https"
        static let host = "newsapi.org"
    }
    
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
