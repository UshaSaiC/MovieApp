//
//  MovieView.swift
//  Movie
//
//  Created by Usha Sai Chintha on 26/09/22.
//

import SwiftUI

struct MovieView: View {
    
    @ObservedObject var movieDataManager = MovieDataManager()
    
    var body: some View {
        
        NavigationView{
            List(movieDataManager.cards) { card in
                ZStack(alignment: .leading) {
                    HStack {
                        MovieImageView(imageURL: card.content.movieLogo, movieName: card.content.title)
                    }
                    .listStyle(PlainListStyle())
                    .navigationBarTitle("Movies")
                    NavigationLink(destination: MovieDetailView(content: card.content)) {
                        EmptyView()
                    }
                    .opacity(0.0)
                }
            }
        }.onAppear {
            self.movieDataManager.fetchData()
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
