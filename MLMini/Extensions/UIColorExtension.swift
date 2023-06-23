//
//  UIColorExtension.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import UIKit

public extension UIColor {
    static var activeYellow: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 230.0 / 255.0, blue: 57.0 / 255.0, alpha: 1.0)
    }
    
    static var activeBlue: UIColor {
        return UIColor(red: 58.0 / 255.0, green: 131.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0)
    }
    
    static var activeGreen: UIColor {
        return UIColor(red: 62.0 / 255.0, green: 123.0 / 255.0, blue: 49.0 / 255.0, alpha: 1.0)
    }
    
    static var softGrey: UIColor {
        return UIColor(red: 225.0 / 255.0, green: 225.0 / 255.0, blue: 225.0 / 255.0, alpha: 1.0)
    }
    
    static var intermediateGrey: UIColor {
        return UIColor(red: 150.0 / 255.0, green: 150.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0)
    }
    
    static var darkGrey: UIColor {
        return UIColor(red: 45.0 / 255.0, green: 45.0 / 255.0, blue: 45.0 / 255.0, alpha: 1.0)
    }
    
    static var nightBlack: UIColor {
        return UIColor(red: 15.0 / 255.0, green: 15.0 / 255.0, blue: 25.0 / 255.0, alpha: 1.0)
    }
    
    static var primaryText: UIColor {
        return nightBlack
    }
    
    static var secondaryText: UIColor {
        return darkGrey
    }
    
    static var terciaryText: UIColor {
        return intermediateGrey
    }
    
    static var invertedText: UIColor {
        return .white
    }
    
    static var primaryBackground: UIColor {
        return UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0)
    }
    
    static var secondaryBackground: UIColor {
        return softGrey
    }
}

import SwiftUI

public extension Color {
    static var activeYellow: Color {
        return Color(uiColor: .activeYellow)
    }

    static var activeBlue: Color {
        return Color(uiColor: .activeBlue)
    }
    
    static var activeGreen: Color {
        return Color(uiColor: .activeGreen)
    }
    
    static var softGrey: Color {
        return Color(uiColor: .softGrey)
    }
    
    static var intermediateGrey: Color {
        return Color(uiColor: .intermediateGrey)
    }
    
    static var darkGrey: Color {
        return Color(uiColor: .darkGrey)
    }
    
    static var nightBlack: Color {
        return Color(uiColor: .nightBlack)
    }
    
    static var primaryText: Color {
        return Color(uiColor: .primaryText)
    }
    
    static var secondaryText: Color {
        return Color(uiColor: .secondaryText)
    }
    
    static var terciaryText: Color {
        return Color(uiColor: .terciaryText)
    }
    
    static var invertedText: Color {
        return Color(uiColor: .invertedText)
    }

    static var primaryBackground: Color {
        return Color(uiColor: .primaryBackground)
    }
    
    static var secondaryBackground: Color {
        return Color(uiColor: .secondaryBackground)
    }
}
