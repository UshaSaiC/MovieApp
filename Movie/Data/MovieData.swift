//
//  MovieData.swift
//  Movie
//
//  Created by Usha Sai Chintha on 26/09/22.
//

import Foundation

struct MovieData: Codable {
    let data: Cards
}

struct Cards: Codable {
    let cards: [Card]
}

struct Card: Codable, Identifiable {
    let id: String
    let content: ContentData
}

struct ContentData: Codable {
    let title: String
    let description: String
    let movieLogo: String
    let rating: Float
}

extension Card {
    enum CodingKeys: String, CodingKey {
        case content
        case id = "card_id"
    }
}

extension ContentData {
    enum CodingKeys: String, CodingKey {
        case title, description, rating
        case movieLogo = "movie_logo"
    }
}
