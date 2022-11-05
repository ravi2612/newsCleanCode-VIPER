//
//  ArticleTableViewCell.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 17/01/22.
//

import UIKit

final class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var lblDescription: UILabel?
    
    static let identifier = "ArticleTableViewCell"
    
    override func awakeFromNib() {
            super.awakeFromNib()
        }
    
    func setup(article: ArticleModel){
        self.lblTitle?.text = article.title
        self.lblDescription?.text = article.description
    }
}
