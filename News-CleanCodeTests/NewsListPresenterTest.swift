//
//  NewsListPresenterTest.swift
//  News-CleanCodeTests
//
//  Created by Ravi navarro on 02/03/22.
//

import XCTest
@testable import News_CleanCode

class NewsListPresenterTest: XCTestCase {
    
    private var sut: NewsListPresenter?
    
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {
        self.sut = nil
    }
    
    func testGetArticleURL_nullURLCase() {
        
        self.sut = NewsListPresenter(ArticleModel(.init(title: "TESTE", description: nil, url: nil)))
        
        let url = self.sut?.getArticleURL()
        XCTAssertNil(url)
    }
    
    func testGetArticleURL_emptyCase(){
        
        self.sut = NewsListPresenter(ArticleModel(.init(title: "TESTE", description: nil, url: "")))
        
        let url = self.sut?.getArticleURL()
        XCTAssertNil(url)
    }
    
    func testGetArticleURL_invalidCase(){
        
        self.sut = NewsListPresenter(ArticleModel(.init(title: "TESTE", description: nil, url: "teste")))
        
        let url = self.sut?.getArticleURL()
        XCTAssertNil(url)
    }
    
    func testGetArticleURL_successCase(){
        
        self.sut = NewsListPresenter(ArticleModel(.init(title: "TESTE", description: nil, url: "https://www.google.com")))
        
        let url = URL(string: "https://www.google.com")!
        
        let getArticleURL = self.sut?.getArticleURL()
        XCTAssertEqual(url, getArticleURL)
        XCTAssertNotNil(getArticleURL)
    }
}
