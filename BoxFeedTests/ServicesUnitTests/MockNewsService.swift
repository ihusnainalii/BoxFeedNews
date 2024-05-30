//
//  ServicesMock.swift
//  BoxFeedTests
//
//  Created by Husnain Ali on 30/05/2024.
//

import Foundation

@testable import BoxFeed
class MockNewsService: NetworkService {
    
    var fetchNewsDataResult: [NewsModel]? = nil
    var fetchSourcesDataResult: [SourceModel]? = nil
    var fetchTopHeadlinesDataResult: [NewsModel]? = nil
    
    func fetchNews(from source: SourceModel, page: Int) async throws -> [NewsModel]? {
        return fetchNewsDataResult
    }
    
    func fetchSources() async throws -> [SourceModel]? {
        return fetchSourcesDataResult
    }
    
    func fetchTopHeadlines() async throws -> [NewsModel]? {
        return fetchTopHeadlinesDataResult
    }
}
