//
//  MovieDataManager.swift
//  Movie
//
//  Created by Usha Sai Chintha on 26/09/22.
//

import Foundation

class MovieDataManager: ObservableObject{
    
    @Published var cards = [Card]()
    
    func fetchData(){
        if let url = URL(string: "https://tw-mobile-hiring.web.app/interview_ios.json"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error ?? "An error occured")
                }else{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                    let movieData = try decoder.decode(Data.self, from: safeData)
                            DispatchQueue.main.async {
                                self.cards = movieData.data.cards
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
}
