//
//  MovieViewModel.swift
//  Movie
//
//  Created by Usha Sai Chintha on 29/09/22.
//

import SwiftUI
import Network

class MovieViewModel: ObservableObject{
    
    @Published var cards = [Card]()
    
    var rowCards: [Card]?
    
    @Published var searchText: String = "" {
        didSet{
            searchResults()
        }
    }
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "MovieDataManager")
    @Published var isConnected = true
    
    var moviesNavigationBarTitle = "Movies"
    var searchValue = "Search for movie"
    
    let service: ServiceProtocol
    init(service: ServiceProtocol = MovieDataManager(url: URL(string: "https://tw-mobile-hiring.web.app/interview_ios.json")!)) {
        self.service = service
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        
        monitor.start(queue: queue)
    }
    
    var connectionDescription: String {
        if isConnected {
            return ""
        } else {
            return "It looks like you're not connected to the internet. Make sure WiFi is enabled and try again"
        }
    }
    
    func getData(){
        service.fetchData { data in
            if data != nil {
                DispatchQueue.main.async {
                    self.rowCards = data!.data.cards
                    self.cards = self.rowCards ?? []
                }
            }
        }
    }
    
    func searchResults() {
        if searchText.isEmpty {
            self.cards = self.rowCards ?? []
        } else {
            self.cards = self.rowCards?.filter { $0.content.title.localizedCaseInsensitiveContains(searchText) || $0.content.description.localizedCaseInsensitiveContains(searchText)  } ?? []
        }
    }
}
