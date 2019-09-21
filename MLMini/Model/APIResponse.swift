
import Foundation

// MARK: - APIResponse
class APIResponse: Codable {
    let siteID: SiteID
    let query: String
    let paging: Paging
    let results: [Result]
    let secondaryResults, relatedResults: [JSONAny]
    let sort: Sort
    let availableSorts: [Sort]
    let filters: [Filter]
    let availableFilters: [AvailableFilter]
    
    enum CodingKeys: String, CodingKey {
        case siteID = "site_id"
        case query, paging, results
        case secondaryResults = "secondary_results"
        case relatedResults = "related_results"
        case sort
        case availableSorts = "available_sorts"
        case filters
        case availableFilters = "available_filters"
    }
    
    init(siteID: SiteID, query: String, paging: Paging, results: [Result], secondaryResults: [JSONAny], relatedResults: [JSONAny], sort: Sort, availableSorts: [Sort], filters: [Filter], availableFilters: [AvailableFilter]) {
        self.siteID = siteID
        self.query = query
        self.paging = paging
        self.results = results
        self.secondaryResults = secondaryResults
        self.relatedResults = relatedResults
        self.sort = sort
        self.availableSorts = availableSorts
        self.filters = filters
        self.availableFilters = availableFilters
    }
}

// MARK: - AvailableFilter
class AvailableFilter: Codable {
    let id, name: String
    let type: TypeEnum
    let values: [AvailableFilterValue]
    
    init(id: String, name: String, type: TypeEnum, values: [AvailableFilterValue]) {
        self.id = id
        self.name = name
        self.type = type
        self.values = values
    }
}

enum TypeEnum: String, Codable {
    case boolean = "boolean"
    case range = "range"
    case string = "STRING"
    case text = "text"
}

// MARK: - AvailableFilterValue
class AvailableFilterValue: Codable {
    let id, name: String
    let results: Int
    
    init(id: String, name: String, results: Int) {
        self.id = id
        self.name = name
        self.results = results
    }
}

// MARK: - Sort
class Sort: Codable {
    let id: String?
    let name: String
    
    init(id: String?, name: String) {
        self.id = id
        self.name = name
    }
}

// MARK: - Filter
class Filter: Codable {
    let id, name: String
    let type: TypeEnum
    let values: [FilterValue]
    
    init(id: String, name: String, type: TypeEnum, values: [FilterValue]) {
        self.id = id
        self.name = name
        self.type = type
        self.values = values
    }
}

// MARK: - FilterValue
class FilterValue: Codable {
    let id, name: String
    let pathFromRoot: [Sort]?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case pathFromRoot = "path_from_root"
    }
    
    init(id: String, name: String, pathFromRoot: [Sort]?) {
        self.id = id
        self.name = name
        self.pathFromRoot = pathFromRoot
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
class Result: Codable {
    let id: String
    let siteID: SiteID
    let title: String
    let seller: Seller
    let price: Double
    let currencyID: CurrencyID
    let availableQuantity, soldQuantity: Int
    let buyingMode: BuyingMode
    let listingTypeID: ListingTypeID
    let stopTime: String
//    let condition: Condition
    let permalink: String
    let thumbnail: String
    let acceptsMercadopago: Bool
    let installments: Installments
//    let address: Address
    let shipping: Shipping?
    let sellerAddress: SellerAddress
//    let attributes: [Attribute]
    let originalPrice: Double?
//    let categoryID: CategoryID
    let officialStoreID: Int?
    let catalogProductID: String?
//    let tags: [ResultTag]
    let catalogListing: Bool?
    let differentialPricing: DifferentialPricing?
    
    enum CodingKeys: String, CodingKey {
        case id
        case siteID = "site_id"
        case title, seller, price
        case currencyID = "currency_id"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case buyingMode = "buying_mode"
        case listingTypeID = "listing_type_id"
        case stopTime = "stop_time"
        case permalink, thumbnail
        case acceptsMercadopago = "accepts_mercadopago"
        case installments, shipping//, address//, shipping
        case sellerAddress = "seller_address"
//        case attributes
        case originalPrice = "original_price"
//        case categoryID = "category_id"
        case officialStoreID = "official_store_id"
        case catalogProductID = "catalog_product_id"
//        case tags
        case catalogListing = "catalog_listing"
        case differentialPricing = "differential_pricing"
    }
    
    init(id: String, siteID: SiteID, title: String, seller: Seller, price: Double, currencyID: CurrencyID, availableQuantity: Int, soldQuantity: Int, buyingMode: BuyingMode, listingTypeID: ListingTypeID, stopTime: String, permalink: String, thumbnail: String, acceptsMercadopago: Bool, installments: Installments, shipping: Shipping, sellerAddress: SellerAddress, originalPrice: Double?, officialStoreID: Int?, catalogProductID: String?, catalogListing: Bool?, differentialPricing: DifferentialPricing?) {
        self.id = id
        self.siteID = siteID
        self.title = title
        self.seller = seller
        self.price = price
        self.currencyID = currencyID
        self.availableQuantity = availableQuantity
        self.soldQuantity = soldQuantity
        self.buyingMode = buyingMode
        self.listingTypeID = listingTypeID
        self.stopTime = stopTime
//        self.condition = condition
        self.permalink = permalink
        self.thumbnail = thumbnail
        self.acceptsMercadopago = acceptsMercadopago
        self.installments = installments
//        self.address = address
        self.shipping = shipping
        self.sellerAddress = sellerAddress
//        self.attributes = attributes
        self.originalPrice = originalPrice
//        self.categoryID = categoryID
        self.officialStoreID = officialStoreID
        self.catalogProductID = catalogProductID
//        self.tags = tags
        self.catalogListing = catalogListing
        self.differentialPricing = differentialPricing
    }
}

// MARK: - Address
class Address: Codable {
    let stateID: StateID
    let stateName: StateName
    let cityID: CityID?
    let cityName: String
    
    enum CodingKeys: String, CodingKey {
        case stateID = "state_id"
        case stateName = "state_name"
        case cityID = "city_id"
        case cityName = "city_name"
    }
    
    init(stateID: StateID, stateName: StateName, cityID: CityID?, cityName: String) {
        self.stateID = stateID
        self.stateName = stateName
        self.cityID = cityID
        self.cityName = cityName
    }
}

enum CityID: String, Codable {
    case tUXBQ1NBTjg4ZmJk = "TUxBQ1NBTjg4ZmJk"
    case tUXBQkJBTDMXMDZa = "TUxBQkJBTDMxMDZa"
    case tUXBQkJBUjM0MDha = "TUxBQkJBUjM0MDha"
    case tUXBQlZJTDQyMjBa = "TUxBQlZJTDQyMjBa"
}

enum StateID: String, Codable {
    case arB = "AR-B"
    case arC = "AR-C"
    case arS = "AR-S"
}

enum StateName: String, Codable {
    case buenosAires = "Buenos Aires"
    case capitalFederal = "Capital Federal"
    case santaFe = "Santa Fe"
}

// MARK: - Attribute
class Attribute: Codable {
    let attributeGroupID: AttributeGroupID
    let attributeGroupName: AttributeGroupName
    let source: Int
    let id: ID
    let name: Name
    let valueID: String?
    let valueName: String
    let valueStruct: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case attributeGroupID = "attribute_group_id"
        case attributeGroupName = "attribute_group_name"
        case source, id, name
        case valueID = "value_id"
        case valueName = "value_name"
        case valueStruct = "value_struct"
    }
    
    init(attributeGroupID: AttributeGroupID, attributeGroupName: AttributeGroupName, source: Int, id: ID, name: Name, valueID: String?, valueName: String, valueStruct: JSONNull?) {
        self.attributeGroupID = attributeGroupID
        self.attributeGroupName = attributeGroupName
        self.source = source
        self.id = id
        self.name = name
        self.valueID = valueID
        self.valueName = valueName
        self.valueStruct = valueStruct
    }
}

enum AttributeGroupID: String, Codable {
    case others = "OTHERS"
}

enum AttributeGroupName: String, Codable {
    case otros = "Otros"
}

enum ID: String, Codable {
    case brand = "BRAND"
    case cpuModel = "CPU_MODEL"
    case detailedModel = "DETAILED_MODEL"
    case gpuModel = "GPU_MODEL"
    case itemCondition = "ITEM_CONDITION"
    case line = "LINE"
    case model = "MODEL"
    case processorModel = "PROCESSOR_MODEL"
    case alphanumericModel = "ALPHANUMERIC_MODEL"
}

enum Name: String, Codable {
    case condiciónDelÍtem = "Condición del ítem"
    case línea = "Línea"
    case marca = "Marca"
    case modelo = "Modelo"
    case modeloDeCPU = "Modelo de CPU"
    case modeloDeGPU = "Modelo de GPU"
    case modeloDelProcesador = "Modelo del procesador"
    case modeloDetallado = "Modelo detallado"
    case modeloAlfanumerico = "Modelo alfanumérico"
}

enum BuyingMode: String, Codable {
    case buyItNow = "buy_it_now"
}

enum CategoryID: String, Codable {
    case mla1055 = "MLA1055"
    case mla3697 = "MLA3697"
}

enum Condition: String, Codable {
    case new = "new"
}

enum CurrencyID: String, Codable {
    case ars = "ARS"
}

// MARK: - DifferentialPricing
class DifferentialPricing: Codable {
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
}

// MARK: - Installments
class Installments: Codable {
    let quantity: Int
    let amount, rate: Double
    let currencyID: CurrencyID
    
    enum CodingKeys: String, CodingKey {
        case quantity, amount, rate
        case currencyID = "currency_id"
    }
    
    init(quantity: Int, amount: Double, rate: Double, currencyID: CurrencyID) {
        self.quantity = quantity
        self.amount = amount
        self.rate = rate
        self.currencyID = currencyID
    }
}

enum ListingTypeID: String, Codable {
    case goldPro = "gold_pro"
    case goldSpecial = "gold_special"
}

// MARK: - Seller
class Seller: Codable {
    let id: Int
    let powerSellerStatus: PowerSellerStatus?
    let carDealer, realEstateAgency: Bool
    let tags: [JSONAny]
    
    enum CodingKeys: String, CodingKey {
        case id
        case powerSellerStatus = "power_seller_status"
        case carDealer = "car_dealer"
        case realEstateAgency = "real_estate_agency"
        case tags
    }
    
    init(id: Int, powerSellerStatus: PowerSellerStatus?, carDealer: Bool, realEstateAgency: Bool, tags: [JSONAny]) {
        self.id = id
        self.powerSellerStatus = powerSellerStatus
        self.carDealer = carDealer
        self.realEstateAgency = realEstateAgency
        self.tags = tags
    }
}

enum PowerSellerStatus: String, Codable {
    case gold = "gold"
    case platinum = "platinum"
    case silver = "silver"
}

// MARK: - SellerAddress
class SellerAddress: Codable {
    let id, comment, addressLine, zipCode: String
    let country, state, city: Sort
    let latitude, longitude: String
    
    enum CodingKeys: String, CodingKey {
        case id, comment
        case addressLine = "address_line"
        case zipCode = "zip_code"
        case country, state, city, latitude, longitude
    }
    
    init(id: String, comment: String, addressLine: String, zipCode: String, country: Sort, state: Sort, city: Sort, latitude: String, longitude: String) {
        self.id = id
        self.comment = comment
        self.addressLine = addressLine
        self.zipCode = zipCode
        self.country = country
        self.state = state
        self.city = city
        self.latitude = latitude
        self.longitude = longitude
    }
}

// MARK: - Shipping
class Shipping: Codable {
    let freeShipping: Bool
    let mode: Mode
    let tags: [ShippingTag]
    let logisticType: LogisticType?
    let storePickUp: Bool
    
    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
        case mode, tags
        case logisticType = "logistic_type"
        case storePickUp = "store_pick_up"
    }
    
    init(freeShipping: Bool, mode: Mode, tags: [ShippingTag], logisticType: LogisticType, storePickUp: Bool) {
        self.freeShipping = freeShipping
        self.mode = mode
        self.tags = tags
        self.logisticType = logisticType
        self.storePickUp = storePickUp
    }
}

enum LogisticType: String, Codable {
    case crossDocking = "cross_docking"
    case custom = "custom"
    case dropOff = "drop_off"
    case xddropOff = "xd_drop_off"
    case fulfillment = "fulfillment"
    case notEspecified = "not_specified"
}

enum Mode: String, Codable {
    case custom = "custom"
    case me2 = "me2"
    case notEspecified = "not_specified"
}

enum ShippingTag: String, Codable {
    case fbmInProcess = "fbm_in_process"
    case fulfillment = "fulfillment"
    case mandatoryFreeShipping = "mandatory_free_shipping"
    case selfServiceIn = "self_service_in"
    case selfServiceOut = "self_service_out"
    case me2 = "me2_available"
}

enum SiteID: String, Codable {
    case mla = "MLA"
}

enum ResultTag: String, Codable {
    case ahora12 = "ahora-12"
    case brandVerified = "brand_verified"
    case cartEligible = "cart_eligible"
    case extendedWarrantyEligible = "extended_warranty_eligible"
    case goodQualityPicture = "good_quality_picture"
    case goodQualityThumbnail = "good_quality_thumbnail"
    case immediatePayment = "immediate_payment"
    case loyaltyDiscountEligible = "loyalty_discount_eligible"
    case todayPromotion = "today_promotion"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
