//
//  StarViewModelTests.swift
//  MovieTests
//
//  Created by Usha Sai Chintha on 12/10/22.
//

import Foundation
import XCTest

class StarViewModelTests: XCTestCase {
    
    func testWidthValueBeingReturnedAsInteger() {
        let viewModel = StarsViewModel()
        let width = viewModel.width(rating: 8, screenWidth: 100)
        XCTAssertEqual(width, 80)
    }
    
    func testWidthValueBeingReturnedAsFloat() {
        let viewModel = StarsViewModel()
        let width = viewModel.width(rating: 4.2386328, screenWidth: 356.987987)
        XCTAssertEqual(width, 151.3140990904174)
    }
    
    func testWholeWidthValueBeingReturned() {
        let viewModel = StarsViewModel()
        let width = viewModel.width(rating: 10, screenWidth: 100)
        XCTAssertEqual(width, 100)
    }
    
    func testZeroWidthValueBeingReturned() {
        let viewModel = StarsViewModel()
        let width = viewModel.width(rating: 0, screenWidth: 100)
        XCTAssertEqual(width, 0)
    }
    
    func testRatingGreaterThanTen() {
        let viewModel = StarsViewModel()
        let width = viewModel.width(rating: 134, screenWidth: 100)
        XCTAssertEqual(width, 100)
    }
    
    func testRatingLessThanZero() {
        let viewModel = StarsViewModel()
        let width = viewModel.width(rating: -5.6, screenWidth: 100)
        XCTAssertEqual(width, 0)
    }
    
}
