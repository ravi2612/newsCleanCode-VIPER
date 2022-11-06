//
//  NewsListView.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 05/11/22.
//

import UIKit
import WebKit

protocol NewsListViewDelegate {
    func showactivityIndicator(_ bool: Bool)
}

final class NewsListView: UIView {
    
    var delegateNewsList: NewsListViewDelegate?
    
    private lazy var bgTopView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stView: UIStackView = {
        var stView = UIStackView()
        stView.alignment = .fill
        stView.translatesAutoresizingMaskIntoConstraints = false
        return stView
    }()
    
    private lazy var imgView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "icon-newspaper")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var lblTitle: UILabel = {
        var label = UILabel()
        label.text = "News"
        label.font = UIFont(name: "Times New Roman", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var wbListNews: WKWebView = {
        var wbView = WKWebView()
        wbView.configuration.mediaTypesRequiringUserActionForPlayback = .all
        wbView.configuration.allowsInlineMediaPlayback = false
        wbView.translatesAutoresizingMaskIntoConstraints = false
        wbView.configuration.dataDetectorTypes = [.all]
        return wbView
    }()
    
    private lazy var vwActivityIndicator: UIActivityIndicatorView = {
        var activity = UIActivityIndicatorView()
        activity.tintColor = .darkGray
        activity.style = .large
        return activity
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - Init View
    //-----------------------------------------------------------------------
    
    init(webDelegate: WKNavigationDelegate, delegate: NewsListViewDelegate) {
        super.init(frame: .zero)
        
        delegateNewsList = delegate
        wbListNews.navigationDelegate = webDelegate
        addSubViews()
        addConstraints()
        addAditionalConfiguration()
        vwActivityIndicator.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Custhom Methods
    //-----------------------------------------------------------------------
    
    func loadNews(url: URL){
        wbListNews.load(URLRequest(url: url))
        layoutIfNeeded()
    }
    
    private func addSubViews(){
        addSubview(bgTopView)
        addSubview(wbListNews)
        addSubview(vwActivityIndicator)
        bgTopView.addSubview(stView)
        bgTopView.addSubview(lblTitle)
        bgTopView.addSubview(imgView)
    }
    
    private func addConstraints(){
        setConstraintBgTopView()
        setConstraintStView()
        setConstraintTbList()
        setConstraintslblTitle()
        setConstraintImgView()
        setConstraintActivityindicator()
    }
    
    private func addAditionalConfiguration(){
        backgroundColor = .white
    }
    
    func activityIndicator(_ show: Bool){
        DispatchQueue.main.async {
            self.wbListNews.bringSubviewToFront(self.vwActivityIndicator)
            self.vwActivityIndicator.isHidden = !show
            if show {
                self.vwActivityIndicator.startAnimating()
            }else {
                self.vwActivityIndicator.stopAnimating()
            }
        }
    }
    
    private func setConstraintBgTopView(){
        bgTopView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        bgTopView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        bgTopView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        bgTopView.heightAnchor.constraint(equalToConstant: 140).isActive = true
    }
    
    private func setConstraintStView(){
        stView.centerXAnchor.constraint(equalTo: bgTopView.centerXAnchor).isActive = true
        stView.centerYAnchor.constraint(equalTo: bgTopView.centerYAnchor).isActive = true
        stView.heightAnchor.constraint(equalToConstant: 85).isActive = true
        stView.widthAnchor.constraint(equalToConstant: 360).isActive = true
    }
    
    private func setConstraintslblTitle(){
        lblTitle.centerYAnchor.constraint(equalTo: stView.centerYAnchor).isActive = true
        lblTitle.centerXAnchor.constraint(equalTo: stView.centerXAnchor,constant: -25).isActive = true
        
    }
    
    private func setConstraintImgView(){
        imgView.centerYAnchor.constraint(equalTo: stView.centerYAnchor).isActive = true
        imgView.leadingAnchor.constraint(equalTo: lblTitle.trailingAnchor, constant: 8).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setConstraintTbList(){
        wbListNews.topAnchor.constraint(equalTo: bgTopView.bottomAnchor, constant: 16).isActive = true
        wbListNews.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        wbListNews.leadingAnchor.constraint(equalTo: bgTopView.leadingAnchor).isActive = true
        wbListNews.trailingAnchor.constraint(equalTo: bgTopView.trailingAnchor).isActive = true
    }
    
    private func setConstraintActivityindicator(){
        vwActivityIndicator.heightAnchor.constraint(equalToConstant: 50).isActive = true
        vwActivityIndicator.widthAnchor.constraint(equalToConstant: 50).isActive = true
        //        vwActivityIndicator.centerXAnchor.constraint(equalTo: wbListNews.centerXAnchor).isActive = true
        //        vwActivityIndicator.centerYAnchor.constraint(equalTo: wbListNews.centerYAnchor).isActive = true
    }
}
