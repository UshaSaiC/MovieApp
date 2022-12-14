//
//  MovieViewModelTests.swift
//  MovieTests
//
//  Created by Usha Sai Chintha on 06/10/22.
//

import XCTest

class MovieViewModelTests: XCTestCase {
    
    func testSuccessFetchData() {
        let expectedResult = MovieData.with()
        let service = MockService(mockData: expectedResult)
        
        let viewModel = MovieViewModel(service: service)
        
        viewModel.getData()
        let expectation = self.expectation(description: "TestSuccessDataOfMovie")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(viewModel.cards.count, 1)
        XCTAssertEqual(viewModel.cards.first?.content.title, "movie title")
        XCTAssertEqual(viewModel.cards.first?.content.description, "description of movie")
        XCTAssertEqual(viewModel.cards.first?.content.movieLogo, "image of movie logo")
        XCTAssertEqual(viewModel.cards.first?.content.rating, 6.798)
    }
    
    func testEmptyData() {
        let expectedResult = MovieData(data: Cards(cards: []))
        let service = MockService(mockData: expectedResult)
        
        let viewModel = MovieViewModel(service: service)
        
        viewModel.getData()
        
        let expectation = self.expectation(description: "TestEmptyDataOfMovie")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(viewModel.cards.count, 0)
    }
    
    func testNilData() {
        let expectedResult: MovieData? = nil
        let service = MockService(mockData: expectedResult)
        
        let viewModel = MovieViewModel(service: service)
        
        viewModel.getData()
        
        let expectation = self.expectation(description: "TestNilDataOfMovie")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(viewModel.cards.count, 0)
    }
    
    func testSearchResultsWhenEmpty() {
        let expectedResult = MovieData.with()
        let service = MockService(mockData: expectedResult)
        
        let viewModel = MovieViewModel(service: service)
        
        viewModel.searchText = ""
        viewModel.getData()
        let expectation = self.expectation(description: "TestSearchTextWhenEmpty")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1, handler: nil)
        
        viewModel.searchResults()
        XCTAssertEqual(viewModel.cards.count, 1)
        XCTAssertEqual(viewModel.cards.first?.content.title, "movie title")
        XCTAssertEqual(viewModel.cards.first?.content.description, "description of movie")
        XCTAssertEqual(viewModel.cards.first?.content.movieLogo, "image of movie logo")
        XCTAssertEqual(viewModel.cards.first?.content.rating, 6.798)
    }
    
    func testSearchResultsForInvalidSearchValue() {
        let expectedResult = MovieData.with()
        let service = MockService(mockData: expectedResult)
        
        let viewModel = MovieViewModel(service: service)
        
        viewModel.searchText = "invalid"
        viewModel.getData()
        let expectation = self.expectation(description: "TestSearchTextIsNotAMatch")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1, handler: nil)
        
        viewModel.searchResults()
        XCTAssertEqual(viewModel.cards.count, 0)
    }
    
    func testSearchResultsForValidSearchValue() {
        let expectedResult = MovieData.with()
        let service = MockService(mockData: expectedResult)
        
        let viewModel = MovieViewModel(service: service)
        
        viewModel.searchText = "title"
        viewModel.getData()
        let expectation = self.expectation(description: "TestSearchTextIsAMatch")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1, handler: nil)
        
        viewModel.searchResults()
        XCTAssertEqual(viewModel.cards.count, 1)
        XCTAssertEqual(viewModel.cards.first?.content.title, "movie title")
    }
    
    func testConnectionMessageWhenNetAvailable() {
        let viewModel = MovieViewModel()
        viewModel.isConnected = true

        XCTAssertTrue(viewModel.connectionDescription.isEmpty)
    }
    
    func testConnectionMessageWhenNetUnAvailable() {
        let viewModel = MovieViewModel()
        viewModel.isConnected = false

        XCTAssertEqual(viewModel.connectionDescription, "It looks like you're not connected to the internet. Make sure WiFi is enabled and try again")
    }
    
    func testSessionErrorMessageWhenDataIsRetrieved() {
        let viewModel = MovieViewModel()
        viewModel.sessionError = false
                                       
        XCTAssertTrue(viewModel.sessionErrorDescription.isEmpty)
    }
    
    func testSessionErrorMessageWhenDataNotRetrieved() {
        let viewModel = MovieViewModel()
        viewModel.sessionError = true
        
        XCTAssertEqual(viewModel.sessionErrorDescription, "Unable to retrieve the required data at the moment. Try later")
    }
}
