//
//  MovieDataManager.swift
//  Movie
//
//  Created by Usha Sai Chintha on 26/09/22.
//

import Foundation

class MovieDataManager{
    
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func fetchData(with completion: @escaping (Data?) -> Void){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                guard let data = data else {
                    completion(nil)
                    return
                }
                let decoder = JSONDecoder()
                completion(try? decoder.decode(Data.self, from: data))
            }
            task.resume()
    }
}
