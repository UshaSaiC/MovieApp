//
//  MovieImageView.swift
//  Movie
//
//  Created by Usha Sai Chintha on 26/09/22.
//

import SwiftUI

struct MovieImageView: View {
    
    var imageURL: String
    var movieName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            AsyncImage(url: URL(string: imageURL)) { image in
                ZStack(alignment: .leading) {
                    image.resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 300, alignment: .center)
                    
                        HStack {
                                Text(movieName)
                                .modifier(TextImageModifier())
                                Spacer()
                    }
                }
            } placeholder: {
                ZStack {
                    Image(systemName: "photo.on.rectangle")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                    HStack {
                        Text(movieName)
                            .modifier(TextImageModifier())
                        Spacer()
                    }
                }
                .padding(.horizontal, 10)
            }
            
        }
        .border(Color("Border"))
    }
}

struct MovieImageView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageView(imageURL: "https://en.wikipedia.org/wiki/The_Conjuring_2#/media/File:Conjuring_2.jpg", movieName: "El Camino' Cooks Up 'Breaking Bad' Easter Eggs")
    }
}
