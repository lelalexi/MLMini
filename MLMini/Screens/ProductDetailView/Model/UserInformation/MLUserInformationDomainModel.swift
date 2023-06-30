//
//  MLUserInformationDomainModel.swift
//  MLMini
//
//  Created by Alexis Garcia Carli on 29/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation

struct MLUserInformationDomainModel: Identifiable {
    var id: Int
    var nickname: String
    var sellerReputation: MLSellerReputationDomainModel
    
    enum CodingKeys: String, CodingKey {
        case id, nickname
        case sellerReputation = "seller_reputation"
    }
}

extension MLUserInformationDomainModel {
    static var _default: MLUserInformationDomainModel { MLUserInformationDomainModel(id: 0,
                                                                                     nickname: "",
                                                                                     sellerReputation: MLSellerReputationDomainModel._default) }
}

struct MLSellerReputationDomainModel {
    var levelId: MLSellerLevel
    
    enum CodingKeys: String, CodingKey {
        case levelId = "level_id"
    }
}

extension MLSellerReputationDomainModel {
    static var _default: MLSellerReputationDomainModel { MLSellerReputationDomainModel(levelId: .unknown) }
    
    enum MLSellerLevel: String {
        case Level5 = "5_green"
        case Level4 = "4_light_green"
        case Level3 = "3_yellow"
        case Level2 = "2_orange"
        case Level1 = "1_red"
        case unknown
        
        init(value: String?) {
            if let value, let sellerLevel = MLSellerLevel(rawValue: value) {
                self = sellerLevel
            } else {
                self = .unknown
            }
        }
        func toMLSellerLevel() -> Int {
            return (rawValue[rawValue.index(rawValue.startIndex, offsetBy: 1)].wholeNumberValue ?? 0) - 1
        }
        
        var mLSellerLevel: Int {
            switch self {
            case .Level5:
                return 4
            case .Level4:
                return 3
            case .Level3:
                return 2
            case .Level2:
                return 1
            case .Level1:
                return 0
            case .unknown:
                return -1
            }
        }
    }
}
