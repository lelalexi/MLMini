
import Foundation

// MARK: - APIResponse
struct ProductListInfraestructureModel: Codable {
    let query: String
    let paging: Paging
    let results: [ProductResult]
    enum CodingKeys: String, CodingKey {
        case query, paging, results
    }
    
    init(query: String, paging: Paging, results: [ProductResult]) {
        self.query = query
        self.paging = paging
        self.results = results
    }
    
    func isEmpty() -> Bool {
        return results.isEmpty
    }
    
    func itemAt(index: Int) -> ItemRowDomainModel {
        if index < results.count && index >= 0 {
            let resp = results[index]
            return ItemRowDomainModel(id: resp.id,
                        price: resp.price,
                        title: resp.title,
                        thumbnail: resp.thumbnail,
                        freeShipping: resp.shipping?.freeShipping ?? false)
        } else {
            return getDefaultModel()
        }
    }
    
    private func getDefaultModel() -> ItemRowDomainModel {
        return ItemRowDomainModel(id: "", price: 0, title: "", thumbnail: "Placeholder", freeShipping: false)
    }
}

extension ProductListInfraestructureModel: Equatable {
    static func == (lhs: ProductListInfraestructureModel, rhs: ProductListInfraestructureModel) -> Bool {
        return lhs.query == rhs.query &&
                lhs.results == rhs.results
    }
}

// MARK: - Paging
class Paging: Codable {
    let total, offset, limit, primaryResults: Int
    
    enum CodingKeys: String, CodingKey {
        case total, offset, limit
        case primaryResults = "primary_results"
    }
    
    init(total: Int, offset: Int, limit: Int, primaryResults: Int) {
        self.total = total
        self.offset = offset
        self.limit = limit
        self.primaryResults = primaryResults
    }
}

// MARK: - Result
struct ProductResult: Codable {
    let id: String
    let title: String
    let price: Double
    let thumbnail: String
    let shipping: Shipping?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title, price
        case thumbnail
        case shipping
    }
}

extension ProductResult: Equatable {
    static func == (lhs: ProductResult, rhs: ProductResult) -> Bool {
        lhs.id == rhs.id
    }
    
}

// MARK: - Shipping
struct Shipping: Codable {
    let freeShipping: Bool
    
    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
    }
    
    init(freeShipping: Bool) {
        self.freeShipping = freeShipping
    }
}
