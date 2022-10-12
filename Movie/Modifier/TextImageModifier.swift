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
            .foregroundColor(AssetColors.textColor)
            .background(AssetColors.backgroundColor)
            .padding(.vertical, 15)
            .frame(alignment: .center)
    }
}
