//
//  NewsRouter.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 10/01/22.
//

import UIKit

enum NewsRouterConstants {
    static var news = "News"
    static var newsView = "NewsView"
}

final class NewsRouter {
    
    var storyboard: UIStoryboard!
    var viewController: UIViewController!
    
    init() {
        
        storyboard = UIStoryboard(name: NewsRouterConstants.news, bundle: nil)
        
        if let controller = storyboard.instantiateViewController(withIdentifier: NewsRouterConstants.newsView) as? NewsTableViewController {
            controller.presenter = NewsPresenter(delegate: controller)
            self.viewController = controller
        }
    }
    
    func showArticle(article: ArticleModel) {
        NewsListRouter().present(article: article)
    }
}
