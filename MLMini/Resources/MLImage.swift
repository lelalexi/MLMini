//
//  MLImage.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 14/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import SwiftUI
import UIKit

struct MLImage {
    struct ConstantsNames {
        static let DAMAGED_PACKAGE = "DamagedPackage"
        static let SEARCH_ICON = "Search"
        static let FAV_ICON = "FavIcon"
        static let MELI_LOGO = "MLLogo"
        static let ATTENTION_MAGNIFIER_GLASSES = "AttentionMagnifierglasses"
    }
    
    // Icons
    static let searchIcon: UIImage = image(named: ConstantsNames.SEARCH_ICON)
    static let SUIsearchIcon: Image = image(named: ConstantsNames.SEARCH_ICON)
    static let favIconIcon: UIImage = image(named: ConstantsNames.FAV_ICON)
    static let SUIfavIconIcon: Image = image(named: ConstantsNames.FAV_ICON)
    // Images
    static let meliLogo: UIImage = image(named: ConstantsNames.MELI_LOGO)
    static let SUImeliLogo: Image = image(named: ConstantsNames.MELI_LOGO)
    static let damagedPackage: UIImage = image(named: ConstantsNames.DAMAGED_PACKAGE)
    static let SUIdamagedPackage: Image = image(named: ConstantsNames.DAMAGED_PACKAGE)
    static let attentionMagnifierglasses: UIImage = image(named: ConstantsNames.ATTENTION_MAGNIFIER_GLASSES)
    static let SUIAttentionMagnifierglasses: Image = image(named: ConstantsNames.ATTENTION_MAGNIFIER_GLASSES)
    
    private static func image(named: String) -> UIImage {
        return UIImage(named: named) ?? UIImage()
    }
    
    private static func image(named: String) -> Image {
        return Image(named)
    }
}
