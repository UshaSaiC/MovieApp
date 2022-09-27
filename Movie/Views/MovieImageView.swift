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
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .border(Color("Border"))
                    .frame(width: .infinity, height: UIScreen.main.bounds.height/2, alignment: .center)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 5)
                
            } placeholder:  {
                Image(systemName: "photo.on.rectangle")
                    .resizable()
                    .frame(width: .infinity, height: UIScreen.main.bounds.height/2, alignment: .center)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 5)
                    .border(Color("Border"))
            }
            
            VStack {
                Spacer()
                HStack {
                    Text(movieName)
                        .modifier(TextImageModifier())
                    
                    Spacer()
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
