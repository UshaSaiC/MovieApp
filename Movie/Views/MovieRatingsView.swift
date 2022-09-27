//
//  MovieRatingsView.swift
//  Movie
//
//  Created by Usha Sai Chintha on 26/09/22.
//

import SwiftUI

struct MovieRatingsView: View {
    let rating: Float
    
    var body: some View {
        GroupBox(){
                HStack {
                    Group {
                        Text("Ratings : ")
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
