//
//  MovieDataManager.swift
//  Movie
//
//  Created by Usha Sai Chintha on 26/09/22.
//

import Foundation

class MovieDataManager: ServiceProtocol{
    
    let url: URL
    var session: URLSessionProtocol
    
    init(url: URL) {
        self.url = url
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        session = URLSession(configuration: config)
    }
    
    func fetchData(with completion: @escaping (MovieData?) -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
            if error != nil {
                print("URLSession Error: \(String(describing: error?.localizedDescription))")
                completion(nil)
            }
            else {
                guard let data = data else {
                    completion(nil)
                    return
                }
                let decoder = JSONDecoder()
                completion(try? decoder.decode(MovieData.self, from: data))
            }
        }
        task.resume()
    }
}
