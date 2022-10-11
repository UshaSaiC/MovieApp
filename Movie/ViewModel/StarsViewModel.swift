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
    
    func width(rating: Double, screenWidth: Double) -> CGFloat? {
        return CGFloat(rating/2.0) / CGFloat(maxRating) * CGFloat(screenWidth)
    }
}
