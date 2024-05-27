//
//  NewsModel.swift
//  BoxFeed
//
//  Created by Husnain Ali on 06/04/24.
//

import Foundation

struct NewsDataModel: Decodable {
    var status: String?
    var totalResults: Int?
    var articles: [NewsModel]?
}

struct NewsModel: Decodable, Hashable {
    
    var id: SourceModel?
    
    var author: String?
    var title: String?
    var description: String?
    
    var url: URL?
    var urlToImage: URL?
    
    var publishedAt: String?
    var content: String?
    
    var publishedDate: String? {
        guard let date = publishedAt?.convertIntoDate() else { return "" }
        return date.format("MMM. dd, yyyy")
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title?.hashValue ?? 0)
    }
    
    static func == (lhs: NewsModel, rhs: NewsModel) -> Bool {
        return lhs.title == rhs.title
    }
}
