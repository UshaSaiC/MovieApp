//
//  TextImageModifier.swift
//  Movie
//
//  Created by Usha Sai Chintha on 27/09/22.
//

import SwiftUI

struct TextImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(Color("Text"))
            .background(Color("Background"))
//            .padding(.horizontal, 8)
            .padding(.vertical, 15)
//            .cornerRadius(10)
            .frame(alignment: .center)
    }
}
