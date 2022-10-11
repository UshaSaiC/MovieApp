//
//  StarsView.swift
//  Movie
//
//  Created by Usha Sai Chintha on 27/09/22.
//

import SwiftUI

struct StarsView: View {
    
    var rating: Double
    var maxRating: Int = 5
    @ObservedObject private var model = StarsViewModel()
    
    var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0 ..< model.maxRating, id: \.self) { _ in
                 Image(systemName: model.imageName)
                     .resizable()
                     .aspectRatio(contentMode: .fit)
             }
         }

         stars.overlay(
             GeometryReader { geometryReader in
                 ZStack(alignment: .leading) {
                     Rectangle()
                         .frame(width: model.width(rating: rating, screenWidth: geometryReader.size.width))
                         .foregroundColor(.yellow)
                 }
             }
             .mask(stars)
         )
         .foregroundColor(.gray)
    }
}

struct StarsView_Previews: PreviewProvider {
    static var previews: some View {
        StarsView(rating: 6.3)
    }
}
