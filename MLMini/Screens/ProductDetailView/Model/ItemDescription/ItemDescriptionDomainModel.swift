//
//  ItemDescriptionDomainModel.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 28/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation

struct ItemDescriptionDomainModel: Identifiable {
    let id = UUID()
    let description: String
}

extension ItemDescriptionDomainModel {
    static var _default: ItemDescriptionDomainModel { ItemDescriptionDomainModel(description: "") }
}
