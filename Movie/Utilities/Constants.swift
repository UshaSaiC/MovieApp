//
//  Constants.swift
//  Movie
//
//  Created by Usha Sai Chintha on 11/10/22.
//

import Foundation
import SwiftUI

let baseUrl = "https://tw-mobile-hiring.web.app/"
let interviewEndpoint = "interview_ios.json"

struct AssetColors {
    static let textColor = Color(red: 207.0/255.0, green: 44.0/255.0, blue: 29.0/255.0, opacity: 1.0)
    
    static private var deviceTheme: UIUserInterfaceStyle {
        return UIScreen.main.traitCollection.userInterfaceStyle
    }
    
    static var borderColor: Color {
        if deviceTheme == .dark {
            return .white
        }
        return .black
    }
    
    static var backgroundColor: Color {
        if deviceTheme == .dark {
            return Color(red: 241.0/255.0, green: 217.0/255.0, blue: 116.0/255.0, opacity: 1)
        }
        return Color(red: 214.0/255.0, green: 182.0/255.0, blue: 98.0/255.0, opacity: 1)
    }
}
