//
//  Constants.swift
//  Movie
//
//  Created by Usha Sai Chintha on 11/10/22.
//

import Foundation
import SwiftUI

let base_url = "https://tw-mobile-hiring.web.app/"
let interview_endpoint = "interview_ios.json"

struct AssetColors {
    static let textColor = Color(red: 207.0/255.0, green: 44.0/255.0, blue: 29.0/255.0, opacity: 1.0)
    
    static var borderColor: UIColor {
            return UIColor { (traits) -> UIColor in
                return traits.userInterfaceStyle == .dark ? .white : .black
            }
    }
    
    static var backgroundColor: UIColor {
            return UIColor { (traits) -> UIColor in
                return traits.userInterfaceStyle == .dark ?
                UIColor(red: 241.0/255.0, green: 217.0/255.0, blue: 116.0/255.0, alpha: 1) :
                UIColor(red: 214.0/255.0, green: 182.0/255.0, blue: 98.0/255.0, alpha: 1)
            }
    }
}
