//
//  URLSessionTests.swift
//  MovieTests
//
//  Created by Usha Sai Chintha on 11/10/22.
//

import XCTest

class URLSessionTests: XCTestCase {
    
    var sut: MovieDataManager!
    var mockSession: MockURLSession!
    
    override func tearDown() {
        sut = nil
        mockSession = nil
        super.tearDown()
    }
    
    func testNilDataWhenInvalidURL() {
        sut = MovieDataManager(url: URL(string: "invalid_url")!)
        
        sut.fetchData(with: { data in
            XCTAssertNil(data)
        })
    }
    
    func testNilDataWhenInvalidDataBeingReturnedByAPI() {
        mockSession = createMockSession(fromJsonFile: "A", andError: nil)
        sut = MovieDataManager(url: URL(string: baseUrl + interviewEndpoint)!)
        sut.session = mockSession
        
        sut.fetchData(with: { data in
            XCTAssertNil(data)
        })
    }
    
    func testSuccessDataWhenValidDataBeingReturnedByAPI() {
        mockSession = createMockSession(fromJsonFile: "MovieData", andError: nil)
        sut = MovieDataManager(url: URL(string: baseUrl + interviewEndpoint)!)
        sut.session = mockSession
        
        sut.fetchData(with: { data in
            XCTAssertNotNil(data)
            let movieContent = data?.data.cards.first?.content
            XCTAssertEqual(movieContent?.title, ContentData.with().title)
            XCTAssertEqual(movieContent?.description, ContentData.with().description)
            XCTAssertEqual(movieContent?.movieLogo, ContentData.with().movieLogo)
            XCTAssertEqual(movieContent?.rating, ContentData.with().rating)
        })
    }
    
    private func loadJsonData(file: String) -> Data? {
        
        if let jsonFilePath = Bundle(for: type(of: self)).path(forResource: file, ofType: "json") {
            let jsonFileURL = URL(fileURLWithPath: jsonFilePath)
            
            if let jsonData = try? Data(contentsOf: jsonFileURL) {
                return jsonData
            }
        }
        return nil
    }
    
    private func createMockSession(fromJsonFile file: String,
                                   andError error: Error?) -> MockURLSession? {
        
        let data = loadJsonData(file: file)
        let response = HTTPURLResponse(url: URL(string: "randomUrl")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        return MockURLSession(completionHandler: (data, response, error))
    }
}
