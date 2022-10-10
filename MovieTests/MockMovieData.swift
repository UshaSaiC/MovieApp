//
//  MockMovieData.swift
//  MovieTests
//
//  Created by Usha Sai Chintha on 08/10/22.
//

import Foundation

extension MovieData {
    static func with(data: Cards = Cards.with()) -> MovieData {
        return MovieData(data: data)
    }
}

extension Cards{
    static func with(cards: [Card] = [Card.with()]) -> Cards {
        return Cards(cards: cards)
    }
}

extension Card{
    static func with(id: String = "1",
                     content: ContentData = ContentData.with()) -> Card {
        return Card(
            id: id,
            content: content
        )
    }
}

extension ContentData {
    static func with(title: String = "movie title",
                     description: String = "description of movie",
                     movieLogo: String = "image of movie logo",
                     rating: Float = 6.798) -> ContentData {
        return ContentData(
            title: title,
            description: description,
            movieLogo: movieLogo,
            rating: rating
        )
    }
}
