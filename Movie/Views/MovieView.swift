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
                ForEach(searchResults) { card in
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
            .navigationBarTitle("Movies", displayMode: .inline)
            .searchable(text: $searchText, prompt: "Search for movie")
        }.onAppear {
            self.movieDataManager.fetchData()
        }
    }
    
    var searchResults: [Card] {
        var filteredCards = [Card]()
        if searchText.isEmpty {
            return movieDataManager.cards
        } else {
            for card in movieDataManager.cards {
                if card.content.title.localizedCaseInsensitiveContains(searchText) || card.content.description.localizedCaseInsensitiveContains(searchText){
                    filteredCards.append(card)
                }
            }
            return filteredCards
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
