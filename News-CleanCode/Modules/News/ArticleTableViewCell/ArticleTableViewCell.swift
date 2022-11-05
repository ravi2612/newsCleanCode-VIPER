//
//  ArticleTableViewCell.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 17/01/22.
//

import UIKit

final class ArticleTableViewCell: UITableViewCell {
            
    private lazy var lblTitle: UILabel = {
        var label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = .systemFont(ofSize: 24)
        label.textColor = .darkGray
        label.numberOfLines = 2
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblDescription: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .gray
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bgView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - Init Views
    //-----------------------------------------------------------------------
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configConstraintsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //-----------------------------------------------------------------------
    //  MARK: - Custhom methods
    //-----------------------------------------------------------------------
    
    func setup(article: ArticleModel){
        lblTitle.text = article.title
        lblDescription.text = article.description
    }
    
    private func addSubviews(){
        addSubview(bgView)
        bgView.addSubview(lblTitle)
        bgView.addSubview(lblDescription)
    }
    
    private func configConstraintsView(){
        setBgViewConstraint()
        setTitleConstraint()
        setSubTitleConstraint()
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Constraints methods
    //-----------------------------------------------------------------------
    
    private func setBgViewConstraint(){
        bgView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        bgView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        bgView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        bgView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func setTitleConstraint(){
        lblTitle.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 8).isActive = true
        lblTitle.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 8).isActive = true
        lblTitle.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -8).isActive = true
    }
    private func setSubTitleConstraint(){
        lblDescription.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 8).isActive = true
        lblDescription.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor).isActive = true
        lblDescription.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -8).isActive = true
        lblDescription.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -8).isActive = true
    }
}
