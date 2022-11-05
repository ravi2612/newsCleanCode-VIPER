//
//  NewsManager.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 03/01/22.
//

import Foundation

final class NewsManager {
    
    private var searchText: String = Constants.AllArticles
    
    func searchData(_ searchText: String, _ completion: @escaping (_ result: Bool, [Article]?) -> ()) {
        self.searchText = searchText
        self.loadData { result, article in
            completion(result, article)
        }
    }
    
    func loadData(_ completion: @escaping (_ result: Bool, [Article]?) -> ()) {
        
        if let baseURL = URL(string: Constants.AllArticlesUrl + searchText), !baseURL.absoluteString.isEmpty {
            let apiURL =  URLRequest(url: baseURL)
           
            URLSession.shared.dataTask(with: apiURL) { data, response, error in
                
                if let error = error {
                    
                    print(error.localizedDescription)
                    completion(false, nil)
                    
                } else if let data = data {
                    
                    let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                    if let articleList = articleList {
                        completion(true, articleList.articles)
                    }else {
                        completion(false, nil)
                    }
                }else{
                    completion(false, nil)
                }
            }.resume()
        }
    }
}
