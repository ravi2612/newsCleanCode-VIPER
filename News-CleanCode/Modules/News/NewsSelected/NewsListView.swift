//
//  NewsListView.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 05/11/22.
//

import UIKit

final class NewsListView: UIView {
    
    private lazy var bgTopView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stView: UIStackView = {
        var stView = UIStackView()
        stView.translatesAutoresizingMaskIntoConstraints = false
        return stView
    }()
    
    private lazy var imgView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var lblTitle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tbListNews: UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - Init View
    //-----------------------------------------------------------------------
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Custhom Methods
    //-----------------------------------------------------------------------
    
    private func addSubViews(){
        addSubview(bgTopView)
        bgTopView.addSubview(tbListNews)
        tbListNews.addSubview(lblTitle)
        tbListNews.addSubview(imgView)
    }
    
    private func addConstraints(){
        
    }
    
    private func addAditionalConfiguration(){
        backgroundColor = .white
    }
}
