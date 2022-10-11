//
//  ServiceProtocol.swift
//  Movie
//
//  Created by Usha Sai Chintha on 08/10/22.
//

import Foundation

protocol ServiceProtocol {
    func fetchData(with completion: @escaping (MovieData?) -> Void)
}
