//
//  NewsListPresenter.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 17/01/22.
//

import UIKit

final class NewsListPresenter {
    
    private var article: ArticleModel

    init(_ data: ArticleModel) {
        self.article = data
    }
    
    func getArticleURL() -> URL?{

        if let urlString = self.article.url,
           let url =  URL(string: (urlString)),
           UIApplication.shared.canOpenURL(url) {
            return url
        }
        return nil
    }
}
