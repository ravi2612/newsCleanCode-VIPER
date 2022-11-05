//
//  Article.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 10/01/22.
//

import Foundation


struct ArticleModel: Equatable {
    static func == (lhs: ArticleModel, rhs: ArticleModel) -> Bool {
        return lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.url == rhs.url
    }
    
    private let article: Article
    
    var title: String {
        return self.article.title
    }
    var description: String {
        return self.article.description ?? ""
    }
    var url: String? {
        return self.article.url
    }
    init(_ article: Article) {
        self.article = article
    }
}

struct Article: Decodable {
    var title: String
    var description: String?
    var url: String?
}

struct ArticleList: Decodable {
    var articles: [Article]?
}
