//
//  NewsListRouter.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 17/01/22.
//
import UIKit

final class NewsListRouter {
    
    var viewController: NewsListViewController!
    var article: ArticleModel?
    
    init(){
         let controller = NewsListViewController()
         self.viewController = controller
    }
    
    func present(article: ArticleModel) {
        
        let presenter = NewsListPresenter(article)
        
        self.viewController.presenter = presenter
        let navController = UINavigationController(rootViewController: viewController)
        UIApplication.topViewController()?.present(navController, animated: true, completion: nil)
    }
}
