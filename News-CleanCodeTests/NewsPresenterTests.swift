//
//  NewsPresenterTests.swift
//  News-CleanCodeTests
//
//  Created by Ravi navarro on 02/03/22.
//

import XCTest
@testable import News_CleanCode

class NewsPresenterTests: XCTestCase {

    private var sut: NewsPresenter?
    
    override func setUpWithError() throws {
        self.sut = NewsPresenter.init(delegate: NewsTableViewController())
    }

    override func tearDownWithError() throws {
        self.sut = nil
    }

    func testNumberOfSections(){
        let numberOfSections = 1
        let sections = self.sut?.numberOfSections
        
        XCTAssertEqual(numberOfSections, sections, "error mensage")
        
    }
    
    func testArticleAtindexEmptyCase(){
        
        self.sut?.articleList = []
        
        for index in -10...10 {
            let article = self.sut?.articleAtIndex(index)
            XCTAssertNil(article)
        }
    }
    
    func testArticleActivityMockedCase(){
        
        let article: ArticleModel = .init(.init(title: "Teste", description: "Teste Description", url: "www.google.com"))
        
        self.sut?.articleList = [article]
        
        for index in -10...10 {
            let _article = self.sut?.articleAtIndex(index)
            if index == 0 {
                XCTAssertNotNil(_article)
                XCTAssertEqual(_article, article)
            }else {
                XCTAssertNil(_article)
            }
        }
    }
}
