//
//  NewsTableViewController.swift
//  News-CleanCode
//
//  Created by Ravi navarro on 03/01/22.
//

import UIKit

final class NewsTableViewController: UITableViewController,
                                     NewsPresenterDelegate,
                                     UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var presenter: NewsPresenter?
    var loading: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = NewsPresenter(delegate: self)
        
        self.searchBar.delegate = self
        
        self.configTableView()
        self.getData()
    }

    //-----------------------------------------------------------------------
    //    MARK: Custom Methods
    //-----------------------------------------------------------------------

    func getData(){
        self.presenter?.loadArticles()
    }
    
    private func configActivityIndicator(){
        
        DispatchQueue.main.async {
            
            self.loading = .init(frame: .init(x: 0, y: 0, width: 40, height: 40))
            self.loading?.center = self.view.center
            self.loading?.style = .large
            self.loading?.color = .darkGray
            self.view.addSubview(self.loading!)
            self.loading?.startAnimating()
        }
    }
    
    //-----------------------------------------------------------------------
    // MARK: - Table view
    //-----------------------------------------------------------------------
    
    private func configTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: String(describing: ArticleTableViewCell.self))
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ArticleTableViewCell.self)) as? ArticleTableViewCell,
           let article = self.presenter?.articleAtIndex(indexPath.row){
            cell.setup(article: article)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRowsInSection(section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let article = self.presenter?.articleAtIndex(indexPath.row) {
            self.presenter?.showArticleSelected(article)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    //-----------------------------------------------------------------------
    //    MARK: SearchBar Delegate
    //-----------------------------------------------------------------------
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.presenter?.verifySearchText(searchText)
    }
    
    //-----------------------------------------------------------------------
    //    MARK: Presenter Delegate
    //-----------------------------------------------------------------------
    
    func fail(message: String?) { }
    
    func loading(_ loading: Bool) {
        
        DispatchQueue.main.async {

            if !loading {
                    self.tableView.reloadData()
                    self.loading?.stopAnimating()
                    self.loading?.removeFromSuperview()
            }else{
                self.configActivityIndicator()

            }
        }
    }
}
