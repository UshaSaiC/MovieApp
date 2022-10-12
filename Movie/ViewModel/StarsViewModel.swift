//
//  StarsViewModel.swift
//  Movie
//
//  Created by Usha Sai Chintha on 10/10/22.
//

import SwiftUI

class StarsViewModel: ObservableObject {
    
    var imageName = "star.fill"
    var maxRating: Int = 5
    
    let rating: Double
    
    init(rating: Double) {
        self.rating = rating
    }
    
    func width(screenWidth: Double) -> CGFloat? {
        var validRating: Double
        if rating < 0 {
            validRating = 0
        } else if rating > 10 {
            validRating = 10
        } else {
            validRating = rating
        }
        return CGFloat(validRating/2.0) / CGFloat(maxRating) * CGFloat(screenWidth)
    }
}
