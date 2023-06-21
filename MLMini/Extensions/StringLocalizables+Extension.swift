//
//  StringLocalizables+Extension.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 21/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation

extension String {
    func localized() -> String {
        /// Returns the localized value for the given key (`self`).
        return NSLocalizedString(self, comment: description)
    }
}
