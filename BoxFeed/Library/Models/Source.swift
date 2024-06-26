//
//  Source.swift
//  BoxFeed
//
//  Created by Husnain Ali on 27/05/2024.
//

import Foundation

struct SourceDataModel: Decodable {
    var status: String?
    var sources: [SourceModel]?
}

struct SourceModel: Decodable, Hashable, Identifiable {
    
    var id: String?
    var name: String?
    var description: String?
    var url:  URL?
    var category: String?
    var language: String?
    var country: String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id?.hashValue ?? 0)
    }
    
    static func == (lhs: SourceModel, rhs: SourceModel) -> Bool {
        return lhs.id == rhs.id
    }
}

extension SourceModel {
    static let testData = [SourceModel(id: "abc-news", name: "ABC News"),
                           SourceModel(id: "abc-news-au", name: "ABC News (AU)"),
                           SourceModel(id: "aftenposten", name: "Aftenposten")]
    
    static let testSource = SourceModel(id: "abc-news", name: "ABC News")
}
