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

extension NewsModel {
    static let testData = NewsModel(id: SourceModel.testSource,
                                    author: "Vinamrata Chaturvedi, Quartz",
                                    title: "Everything to Know About Bitcoin Pizza Day",
                                    description: "On May 22, 2010, a man in Florida paid 10,000 Bitcoin for pizza.Read more...",
                                    url: URL(string: "https://gizmodo.com/bitcoin-pizza-day-date-origin-history-cryptocurrency-1851487831"),
                                    urlToImage: URL(string: "https://i.kinja-img.com/image/upload/c_fill,h_675,pg_1,q_80,w_1200/98aec6479bad523f5c89763f4acf0cf9.jpg"),
                                    publishedAt: "2024-05-20T13:20:00Z",
                                    content: "On January 3, 2009, Bitcoins creator, Satoshi Nakamoto, mined the first block of the Bitcoin blockchain, known as the Genesis Block, which contained a reward of 50 Bitcoin. The technical foundations … [+1156 chars]")
    
    static let testDataArray = [NewsModel(id: SourceModel.testData[0],
                                          author: "Vinamrata Chaturvedi, Quartz",
                                          title: "Everything to Know About Bitcoin Pizza Day",
                                          description: "On May 22, 2010, a man in Florida paid 10,000 Bitcoin for pizza.Read more...",
                                          url: URL(string: "https://gizmodo.com/bitcoin-pizza-day-date-origin-history-cryptocurrency-1851487831"),
                                          urlToImage: URL(string: "https://i.kinja-img.com/image/upload/c_fill,h_675,pg_1,q_80,w_1200/98aec6479bad523f5c89763f4acf0cf9.jpg"),
                                          publishedAt: "2024-05-20T13:20:00Z",
                                          content: "On January 3, 2009, Bitcoins creator, Satoshi Nakamoto, mined the first block of the Bitcoin blockchain, known as the Genesis Block, which contained a reward of 50 Bitcoin. The technical foundations … [+1156 chars]"),
                                NewsModel(id: SourceModel.testData[1],
                                          author: "Vinamrata Chaturvedi, Quartz",
                                          title: "Everything to Know About Bitcoin Pizza Day",
                                          description: "On May 22, 2010, a man in Florida paid 10,000 Bitcoin for pizza.Read more...",
                                          url: URL(string: "https://gizmodo.com/bitcoin-pizza-day-date-origin-history-cryptocurrency-1851487831"),
                                          urlToImage: URL(string: "https://i.kinja-img.com/image/upload/c_fill,h_675,pg_1,q_80,w_1200/98aec6479bad523f5c89763f4acf0cf9.jpg"),
                                          publishedAt: "2024-05-20T13:20:00Z",
                                          content: "On January 3, 2009, Bitcoins creator, Satoshi Nakamoto, mined the first block of the Bitcoin blockchain, known as the Genesis Block, which contained a reward of 50 Bitcoin. The technical foundations … [+1156 chars]"),
                                NewsModel(id: SourceModel.testData[2],
                                          author: "Vinamrata Chaturvedi, Quartz",
                                          title: "Everything to Know About Bitcoin Pizza Day",
                                          description: "On May 22, 2010, a man in Florida paid 10,000 Bitcoin for pizza.Read more...",
                                          url: URL(string: "https://gizmodo.com/bitcoin-pizza-day-date-origin-history-cryptocurrency-1851487831"),
                                          urlToImage: URL(string: "https://i.kinja-img.com/image/upload/c_fill,h_675,pg_1,q_80,w_1200/98aec6479bad523f5c89763f4acf0cf9.jpg"),
                                          publishedAt: "2024-05-20T13:20:00Z",
                                          content: "On January 3, 2009, Bitcoins creator, Satoshi Nakamoto, mined the first block of the Bitcoin blockchain, known as the Genesis Block, which contained a reward of 50 Bitcoin. The technical foundations … [+1156 chars]"),
                                NewsModel(id: SourceModel.testSource,
                                          author: "Vinamrata Chaturvedi, Quartz",
                                          title: "Everything to Know About Bitcoin Pizza Day",
                                          description: "On May 22, 2010, a man in Florida paid 10,000 Bitcoin for pizza.Read more...",
                                          url: URL(string: "https://gizmodo.com/bitcoin-pizza-day-date-origin-history-cryptocurrency-1851487831"),
                                          urlToImage: URL(string: "https://i.kinja-img.com/image/upload/c_fill,h_675,pg_1,q_80,w_1200/98aec6479bad523f5c89763f4acf0cf9.jpg"),
                                          publishedAt: "2024-05-20T13:20:00Z",
                                          content: "On January 3, 2009, Bitcoins creator, Satoshi Nakamoto, mined the first block of the Bitcoin blockchain, known as the Genesis Block, which contained a reward of 50 Bitcoin. The technical foundations … [+1156 chars]")]
}
