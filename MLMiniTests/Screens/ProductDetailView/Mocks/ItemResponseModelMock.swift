//
//  ItemResponseModelMock.swift
//  MLMiniTests
//
//  Created by Alexis Garcia Carli on 23/06/2023.
//  Copyright © 2023 ale. All rights reserved.
//

import Foundation
@testable import MLMini

struct ItemResponseModelMock {
    static func resolveModel() -> ItemDetailInfraestructureModel {
        ItemDetailInfraestructureModel(id: "Some ID",
                          title: "Some Title",
                          sellerID: 43847,
                          categoryID: "Some Category",
                          price: 23.45,
                          initialQuantity: 2,
                          availableQuantity: 1,
                          soldQuantity: 1,
                          condition: "New",
                          permalink: "Some Link",
                          thumbnail: "Image.com",
                          secureThumbnail: "SecureImage.com",
                          pictures: [Picture(url: "Some URL", secureURL: "SomeSecureURL")],
                          descriptions: [Description(id: "Some Description ID")],
                          acceptsMercadopago: true,
                          status: "Active")
    }
}
