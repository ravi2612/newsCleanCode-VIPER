//
//  NewsListViewController.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 17/01/22.
//
import UIKit
import WebKit

final class NewsListViewController: UIViewController,
                                    WKNavigationDelegate,
                                    NewsListViewDelegate{
    
    var presenter: NewsListPresenter?
    private var articleList: ArticleList?
    private var url: URL?
    weak var customView: NewsListView?
        
    //-----------------------------------------------------------------------
    //    MARK: App life cycle
    //-----------------------------------------------------------------------
    
    override func loadView() {
        view = NewsListView(webDelegate: self, delegate: self)
        customView = view as? NewsListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //-----------------------------------------------------------------------
    //    MARK: Custom Methods
    //-----------------------------------------------------------------------
    
    private func setupUI() {
        
        self.configWebView()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func configWebView() {
        
        if let url = self.presenter?.getArticleURL(){
            self.loading(true)
            customView?.loadNews(url: url)
        }
    }
    
    //-----------------------------------------------------------------------
    //    MARK: WKNavigationDelegate
    //-----------------------------------------------------------------------

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.loading(false)
    }
    
    //-----------------------------------------------------------------------
    //    MARK: Presenter Delegate
    //-----------------------------------------------------------------------
    
    func fail(message: String?) { }
    
    func loading(_ loading: Bool) {
        showactivityIndicator(loading)
    }
    //-----------------------------------------------------------------------
    //    MARK: newListView Delegate
    //-----------------------------------------------------------------------
    
    func showactivityIndicator(_ bool: Bool) {
        customView?.activityIndicator(bool)
    }
}
