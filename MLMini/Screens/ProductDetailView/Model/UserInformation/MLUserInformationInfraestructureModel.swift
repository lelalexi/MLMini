//
//  MLUserInformationInfraestructureModel.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 29/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation

struct MLUserInformationInfraestructureModel: Decodable {
    var id: Int
    var nickname: String
    var sellerReputation: MLSellerReputationInfraestructureModel
    
    enum CodingKeys: String, CodingKey {
        case id, nickname
        case sellerReputation = "seller_reputation"
    }
    
    func toModel() -> MLUserInformationDomainModel {
        return MLUserInformationDomainModel(id: id,
                                            nickname: nickname,
                                            sellerReputation: sellerReputation.toModel())
    }
}

struct MLSellerReputationInfraestructureModel: Decodable {
    var levelId: String?
    
    enum CodingKeys: String, CodingKey {
        case levelId = "level_id"
    }
    
    func toModel() -> MLSellerReputationDomainModel {
        return MLSellerReputationDomainModel(levelId: MLSellerReputationDomainModel.MLSellerLevel(value: levelId))
    }
}
