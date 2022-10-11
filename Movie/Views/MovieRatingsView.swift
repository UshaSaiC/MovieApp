//
//  MovieRatingsView.swift
//  Movie
//
//  Created by Usha Sai Chintha on 26/09/22.
//

import SwiftUI

struct MovieRatingsView: View {
    
    @ObservedObject private var model = MovieRatingsViewModel()
    let rating: Double
    
    var body: some View {
        GroupBox {
                HStack {
                    Group {
                        Text(model.ratingsLabel)
                        Spacer()
                        StarsView(rating: rating)
                }
                    .padding(.horizontal)
            }
        }
    }
}

struct MovieRatingsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRatingsView(rating: 8.9)
    }
}
