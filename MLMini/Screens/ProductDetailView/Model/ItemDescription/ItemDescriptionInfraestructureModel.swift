//
//  ItemDescriptionInfraestructureModel.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 28/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

struct ItemDescriptionInfraestructureModel: Decodable {
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case description = "plain_text"
    }
    
    func toModel() -> ItemDescriptionDomainModel {
        return ItemDescriptionDomainModel(description: description)
    }
}
