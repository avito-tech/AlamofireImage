import Alamofire

public protocol ImageCacheIdentifiersProvider {
    associatedtype IdentifierSeed
    
    func identifier(for seed: IdentifierSeed) -> String
}

public struct ImageRequestCacheIdentifiersProvider: ImageCacheIdentifiersProvider {
    public typealias IdentifierSeed = (request: URLRequestConvertible, imageFilter: ImageFilter?)
    
    public init() {}
    
    public func identifier(for seed: IdentifierSeed) -> String {
        var key = seed.request.urlRequest?.url?.absoluteString ?? ""
        
        if let filterIdentifier = seed.imageFilter?.identifier {
            key += "-\(filterIdentifier)"
        }
        
        return key
    }
}
