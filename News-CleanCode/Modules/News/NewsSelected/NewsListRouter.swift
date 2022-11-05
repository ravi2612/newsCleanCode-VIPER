//
//  NewsListRouter.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 17/01/22.
//
import UIKit

enum NewsListRouterConstants {
    static var news = "News"
    static var newsListIdentifier = "NewsListView"
}

final class NewsListRouter {
    
    var storyboard: UIStoryboard!
    var viewController: NewsListViewController!
    var article: ArticleModel?
    
    init() {
        
        storyboard = UIStoryboard(name: NewsListRouterConstants.news, bundle: nil)
        
        if let controller = storyboard.instantiateViewController(withIdentifier: NewsListRouterConstants.newsListIdentifier) as? NewsListViewController {
            self.viewController = controller
        }
    }
    
    func present(article: ArticleModel) {
        
        let presenter = NewsListPresenter(article)
        
        self.viewController.presenter = presenter
        let navController = UINavigationController(rootViewController: viewController)
        UIApplication.topViewController()?.present(navController, animated: true, completion: nil)
    }
}
