//
//  NewsRouter.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 10/01/22.
//

import UIKit

final class NewsRouter {
    
    var storyboard: UIStoryboard!
    var viewController: UIViewController!
    
    init() {
        
        storyboard = UIStoryboard(name: "News", bundle: nil)
        
        if let controller = storyboard.instantiateViewController(withIdentifier: "NewsView") as? NewsTableViewController {
            controller.presenter = NewsPresenter(delegate: controller)
            self.viewController = controller
        }
    }
    
    func showArticle(article: ArticleModel) {
        NewsListRouter().present(article: article)
    }
}
