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
        ZStack{
            if let safeURL = URL(string: imageURL) {
                AsyncImage(url: safeURL) { image in
                    image
                        .resizable()
                        .border(Color("Border"))
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height, alignment: .center)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 5)
                    
                } placeholder:  {
                    Image(systemName: "photo.on.rectangle")
                        .resizable()
                        .border(Color("Border"))
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height, alignment: .center)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 5)
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    Text(movieName)
                        .modifier(TextImageModifier())
                }
            }
        }
    }
}

struct MovieImageView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageView(imageURL: "https://m.media-amazon.com/images/M/MV5BMjFjOGEwYjAtNDQxYy00OThhLWI3NDYtYTEyOGRlZDRhN2ViXkEyXkFqcGdeQXRyYW5zY29kZS13b3JrZmxvdw@@._V1_.jpg", movieName: "El Camino' Cooks Up 'Breaking Bad' Easter Eggs")
    }
}
