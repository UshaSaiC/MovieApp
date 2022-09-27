//
//  MovieDetailView.swift
//  Movie
//
//  Created by Usha Sai Chintha on 26/09/22.
//

import SwiftUI

struct MovieDetailView: View {
    
    var content: ContentData
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                
                AsyncImage(url: URL(string: content.movieLogo)) { image in
                        image.resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity, maxHeight: 300, alignment: .center)
                } placeholder: {
                        Image(systemName: "photo.on.rectangle")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                }
                
                
                Text(content.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                
                Text(content.description)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                
                MovieRatingsView(rating: content.rating)
            }
        }
        .padding(.horizontal, 10)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(content: ContentData(title: "Usha", description: "Hosdije3dhu3jdkdlkw2lks eudhiurdjijrd 3ekdji3jd", movieLogo: "https://m.media-amazon.com/images/M/MV5BMjFjOGEwYjAtNDQxYy00OThhLWI3NDYtYTEyOGRlZDRhN2ViXkEyXkFqcGdeQXRyYW5zY29kZS13b3JrZmxvdw@@._V1_.jpg", rating: 6.78))
    }
}
