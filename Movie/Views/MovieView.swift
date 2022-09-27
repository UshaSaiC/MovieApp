//
//  MovieView.swift
//  Movie
//
//  Created by Usha Sai Chintha on 26/09/22.
//

import SwiftUI

struct MovieView: View {
    
    @ObservedObject var movieDataManager = MovieDataManager()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView{
            List {
                if searchText.isEmpty {
                    ForEach(movieDataManager.cards) { card in
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
                } else {
                    ForEach(movieDataManager.cards) {card in
                        if card.content.title.localizedCaseInsensitiveContains(searchText){
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
                }
            }
            .navigationBarTitle("Movies", displayMode: .inline)
            .searchable(text: $searchText, prompt: "Search for movie")
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
