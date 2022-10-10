//
//  MovieView.swift
//  Movie
//
//  Created by Usha Sai Chintha on 26/09/22.
//

import SwiftUI

struct MovieView: View {
    
    @ObservedObject private var model = MovieViewModel()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(model.cards) { card in 
                    ZStack(alignment: .leading) {
                        HStack {
                            MovieImageView(imageURL: card.content.movieLogo, movieName: card.content.title)
                        }
                        .listStyle(PlainListStyle())
                        NavigationLink(destination: MovieDetailView(content: card.content)) {
                            EmptyView()
                        }
                        .opacity(0.0)
                    }
                }
            }
            .navigationBarTitle(model.moviesNavigationBarTitle, displayMode: .inline)
            .searchable(text: $model.searchText, prompt: model.searchValue)
        }.onAppear {
            model.getData()
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
