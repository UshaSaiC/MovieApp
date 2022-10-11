//
//  MovieDataTests.swift
//  MovieTests
//
//  Created by Usha Sai Chintha on 08/10/22.
//

import XCTest

class MovieDataTests: XCTestCase{
    
    func testSuccessParserForMovieData() {
        let json = """
  {
    "data": {
      "cards": [
        {
          "card_id": "1",
          "content": {
            "title": "movie title",
            "description": "description of movie",
            "movie_logo": "image of movie logo",
            "rating": 6.798
          }
        }
      ]
    }
  }
  """.data(using: .utf8)!
        
        let movie = try! JSONDecoder().decode(MovieData.self, from: json)
        
        XCTAssertNotNil(movie)
        let movieContent = movie.data.cards.first?.content
        XCTAssertEqual(movieContent?.title, ContentData.with().title)
        XCTAssertEqual(movieContent?.description, ContentData.with().description)
        XCTAssertEqual(movieContent?.movieLogo, ContentData.with().movieLogo)
        XCTAssertEqual(movieContent?.rating, ContentData.with().rating)
    }
    
    func testSuccessParserForCards() {
        let json = """
  {
      "cards": [
        {
          "card_id": "1",
          "content": {
            "title": "movie title",
            "description": "description of movie",
            "movie_logo": "image of movie logo",
            "rating": 6.798
          }
        }
      ]
  }
  """.data(using: .utf8)!
        
        let cards = try! JSONDecoder().decode(Cards.self, from: json)
        
        XCTAssertNotNil(cards)
        let cardsContent = cards.cards.first?.content
        XCTAssertEqual(cardsContent?.title, ContentData.with().title)
        XCTAssertEqual(cardsContent?.description, ContentData.with().description)
        XCTAssertEqual(cardsContent?.movieLogo, ContentData.with().movieLogo)
        XCTAssertEqual(cardsContent?.rating, ContentData.with().rating)
    }
    
    func testSuccessParserForCard() {
        let json = """
        {
          "card_id": "1",
          "content": {
            "title": "movie title",
            "description": "description of movie",
            "movie_logo": "image of movie logo",
            "rating": 6.798
          }
        }
  """.data(using: .utf8)!
        
        let card = try! JSONDecoder().decode(Card.self, from: json)
        
        XCTAssertNotNil(card)
        XCTAssertEqual(card.id, Card.with().id)
        let cardContent = card.content
        XCTAssertEqual(cardContent.title, ContentData.with().title)
        XCTAssertEqual(cardContent.description, ContentData.with().description)
        XCTAssertEqual(cardContent.movieLogo, ContentData.with().movieLogo)
        XCTAssertEqual(cardContent.rating, ContentData.with().rating)
    }
    
    func testSuccessParserForContentData() {
        let json = """
            {
            "title": "movie title",
            "description": "description of movie",
            "movie_logo": "image of movie logo",
            "rating": 6.798
          }
  """.data(using: .utf8)!
        
        let content = try! JSONDecoder().decode(ContentData.self, from: json)
        
        XCTAssertNotNil(content)
        XCTAssertEqual(content.title, ContentData.with().title)
        XCTAssertEqual(content.description, ContentData.with().description)
        XCTAssertEqual(content.movieLogo, ContentData.with().movieLogo)
        XCTAssertEqual(content.rating, ContentData.with().rating)
    }
    
}
