//
//  NewsListRouter.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 17/01/22.
//
import UIKit

final class NewsListRouter {
    
    var storyboard: UIStoryboard!
    var viewController: NewsListViewController!
    var article: ArticleModel?
    
    init() {
        
        storyboard = UIStoryboard(name: "News", bundle: nil)
        
        if let controller = storyboard.instantiateViewController(withIdentifier: "NewsListView") as? NewsListViewController {
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
