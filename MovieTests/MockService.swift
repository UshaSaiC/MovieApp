//
//  MockService.swift
//  MovieTests
//
//  Created by Usha Sai Chintha on 08/10/22.
//

import Foundation

class MockService : ServiceProtocol {
    let mockData: MovieData?
    
    init(mockData: MovieData?) {
        self.mockData = mockData
    }
    
    func fetchData(with completion: @escaping (MovieData?) -> Void) {
        completion(mockData)
    }
}
