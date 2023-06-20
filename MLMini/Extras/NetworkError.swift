//
//  MercadolibreService.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit

enum NetworkError: Error {
    case invalidUrl
    case decodingError(errorDescription: String)
    case serverError(errorCode: Int, errorDescription: String)
    case someError //Expand this errors to be able to handle different situations at UI or code
}
