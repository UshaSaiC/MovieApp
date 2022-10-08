//
//  MovieViewModelTests.swift
//  MovieTests
//
//  Created by Usha Sai Chintha on 06/10/22.
//

import XCTest

class MovieViewModelTests: XCTestCase{
    
    func testSuccessFetchData() {
        let expectedResult = MovieData.with()
        let service = MockService(mockData: expectedResult)

        let viewModel = MovieViewModel(service: service)

            viewModel.getData()
            XCTAssertEqual(viewModel.cards.count, 0)
    }
    
    func testEmptyData() {
        let expectedResult = MovieData(data: Cards(cards: []))
        let service = MockService(mockData: expectedResult)

        let viewModel = MovieViewModel(service: service)

        viewModel.getData()

        XCTAssertEqual(viewModel.cards.count, 0)
    }

    func testNilData() {
        let expectedResult: MovieData? = nil
        let service = MockService(mockData: expectedResult)

        let viewModel = MovieViewModel(service: service)

        viewModel.getData()
        
        XCTAssertEqual(viewModel.cards.count, 0)
    }
}

