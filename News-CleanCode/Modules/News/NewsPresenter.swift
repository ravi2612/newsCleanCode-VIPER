//
//  NewsPresenter.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 03/01/22.
//

import Foundation

protocol NewsPresenterDelegate {
    func fail(message: String?)
    func loading(_ loading: Bool)
}

final class NewsPresenter {
    
    var articleList: [ArticleModel] = []
    var delegate: NewsPresenterDelegate!
    
    init(delegate: NewsPresenterDelegate) {
        self.delegate = delegate
    }
    
    //-----------------------------------------------------------------------
    //    MARK: Custom Methods
    //-----------------------------------------------------------------------
    
    func showArticleSelected(_ article: ArticleModel?) {
        
        if let article = article {
            NewsRouter().showArticle(article: article)
        }
    }

    func loadArticles() {
        
        self.delegate.loading(true)
        
        NewsManager().loadData { result, articles in
            
            if result {
                self.articleList = self.createArticleList(articles ?? [])
            }
            self.delegate.loading(false)
        }
    }
    
    func verifySearchText(_ text: String) {
        
        var searchText = text
        
        if searchText.isEmpty {
            searchText = Constants.Developers
        }
        self.searchArticles(searchText)
    }
    
    func searchArticles(_ text: String) {
        
        NewsManager().searchData(text) { result, articles in
            
            if result {
                self.articleList = self.createArticleList(articles ?? [])
            }
            self.delegate.loading(false)
        }
    }
    
    private func createArticleList(_ articles: [Article]) -> [ArticleModel] {
        var articleList: [ArticleModel] = []
        
        articles.forEach { article in
            articleList.append(ArticleModel(article))
        }
        return articleList
    }
    
    //-----------------------------------------------------------------------
    //    MARK: TableView Methods
    //-----------------------------------------------------------------------
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articleList.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleModel? {
        
        if articleList.count > index && index >= 0{
            let article = articleList[index]
            return article
        }
        return nil
    }
}
