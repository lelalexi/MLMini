//
//  MercadolibreService.swift
//  MLMini
//
//  Created by Gaston Alexis Garcia Carli on 20/09/2019.
//  Copyright © 2019 ale. All rights reserved.
//

import UIKit

enum UrlErrors: Error {
    case invalidUrl
}

public class AdapterFactory {
    
    var adapter: APIAdapterProtocol
    
    public init() {
        let serviceManager = ServiceManager()
        self.adapter = MercadoLibreAdapter(serviceManager)
    }
}

class MercadoLibreAdapter: APIAdapterProtocol {
    
    var itemListResponse: APIResponseModel?
    var serviceManager: ServiceManagerProtocol
    
    init(_ serviceManager: ServiceManagerProtocol) {
        self.serviceManager = serviceManager
    }
    
    func getItemsByName(name: String, completionHandler: @escaping (Error?) -> Void){
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.mercadolibre.com"
        urlComponents.path = "/sites/MLA/search"
        let queryItem = URLQueryItem(name: "q", value: name)
        urlComponents.queryItems = [queryItem]
        
        if let url = urlComponents.url {
            serviceManager.performRequest(apiURL: url) { [weak self] (response: APIResponseModel?, error: Error?) -> Void in
                if (error != nil){
                    print(error)
                    completionHandler(error)
                } else {
                    self?.itemListResponse = response
                    completionHandler(nil)
                }
            }
        } else {
            completionHandler(UrlErrors.invalidUrl)
        }
    }
    
    func getItemDescriptionByIndex(index: Int, completionHandler: @escaping (ItemDescription?, Error?) -> Void) -> Void {
        
        var item: ItemDescription?

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.mercadolibre.com"
        urlComponents.path = "/items/" + (itemListResponse?.results[index].id)! // Im always sure that if I loaded the table with info the user is going to select a valid row
        
        if let url = urlComponents.url {
            serviceManager.performRequest(apiURL: url) { (response: ItemResponseModel?, error: Error?) -> Void in
                if (error != nil){
                    completionHandler(nil, error)
                } else {
                    var itemPictureArray = [String]()
                    for pic in response!.pictures{
                        itemPictureArray.append(pic.url)
                    }
                    item = ItemDescription (id: response!.id,
                                            price: Double(response!.price),
                                            title: response!.title,
                                            pictures: itemPictureArray,
                                            soldQuantity: response!.soldQuantity,
                                            thumbnail: response!.thumbnail,
                                            availableItems: response!.availableQuantity)
                    completionHandler(item, nil)
                }
            }
        } else {
            completionHandler(nil, UrlErrors.invalidUrl)
        }
    }
    
    func emptyResults() -> Bool {
        return itemListResponse?.results.isEmpty ?? true
    }
    
    func numberOfItems() -> Int {
        return itemListResponse?.results.count ?? 0
    }
    
    func itemAt(index: Int) -> Item {
        var item = Item(id: "", price: 0, title: "", thumbnail: "Placeholder", freeShipping: false)
        if let resp = itemListResponse?.results[index] {
            item = Item(id: resp.id,
                        price: resp.price,
                        title: resp.title,
                        thumbnail: resp.thumbnail,
                        freeShipping: resp.shipping?.freeShipping ?? false)
        }
        return item
    }
    
}
