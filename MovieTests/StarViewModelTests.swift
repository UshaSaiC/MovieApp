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
        let rating: Double = 8
        let viewModel = StarsViewModel(rating: rating)
        let width = viewModel.width(screenWidth: 100)
        XCTAssertEqual(width, 80)
    }
    
    func testWidthValueBeingReturnedAsFloat() {
        let rating: Double = 4.2386328
        let viewModel = StarsViewModel(rating: rating)
        let width = viewModel.width(screenWidth: 356.987987)
        XCTAssertEqual(width, 151.3140990904174)
    }
    
    func testWholeWidthValueBeingReturned() {
        let rating: Double = 10
        let viewModel = StarsViewModel(rating: rating)
        let width = viewModel.width(screenWidth: 100)
        XCTAssertEqual(width, 100)
    }
    
    func testZeroWidthValueBeingReturned() {
        let rating: Double = 0
        let viewModel = StarsViewModel(rating: rating)
        let width = viewModel.width(screenWidth: 100)
        XCTAssertEqual(width, 0)
    }
    
    func testRatingGreaterThanTen() {
        let rating: Double = 134
        let viewModel = StarsViewModel(rating: rating)
        let width = viewModel.width(screenWidth: 100)
        XCTAssertEqual(width, 100)
    }
    
    func testRatingLessThanZero() {
        let rating: Double = -5.6
        let viewModel = StarsViewModel(rating: rating)
        let width = viewModel.width(screenWidth: 100)
        XCTAssertEqual(width, 0)
    }
}
