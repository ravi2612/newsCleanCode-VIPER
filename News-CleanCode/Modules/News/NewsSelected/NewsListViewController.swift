//
//  NewsListViewController.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 17/01/22.
//
import UIKit
import WebKit

final class NewsListViewController: UIViewController,
                                    WKNavigationDelegate{
    
    var presenter: NewsListPresenter?
    private var articleList: ArticleList?
    private var url: URL?
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var vwActivityIndicator: UIActivityIndicatorView!
    //-----------------------------------------------------------------------
    //    MARK: App life cycle
    //-----------------------------------------------------------------------
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
        
        webView.configuration.mediaTypesRequiringUserActionForPlayback = .all
        webView.configuration.allowsInlineMediaPlayback = false
        
        if let url = self.presenter?.getArticleURL(){
            self.loading(true)
            webView.navigationDelegate = self
            webView.load(URLRequest(url: url))
            self.view.layoutIfNeeded()
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
        
        DispatchQueue.main.async {
            self.vwActivityIndicator.isHidden = !loading
            if loading {
                self.vwActivityIndicator.startAnimating()
            }else{
                self.vwActivityIndicator.stopAnimating()
            }
        }
    }
}
