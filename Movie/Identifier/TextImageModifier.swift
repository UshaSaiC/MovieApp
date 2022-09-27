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
            .foregroundColor(.accentColor)
            .font(.title2)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
            .frame(maxWidth: 100)
    }
}
