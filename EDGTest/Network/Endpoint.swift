//
//  Endpoint.swift
//  SwiftUISaMPLE
//
//  Created by sajith on 28/12/22.
//


import Foundation
protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
}

extension Endpoint {
    
    var apiKey: String {
        return ""
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.query = apiKey
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}

enum AppFeed {
    case productListing
    case productDetail(id: Int)
}

extension AppFeed: Endpoint {
    var method: HTTPMethod {
        return .get
    }
    
    var base: String {
        "https://run.mocky.io"
    }
    
    var path: String {
        switch self {
        case .productListing:
            return "/v3/2f06b453-8375-43cf-861a-06e95a951328"

        case let .productDetail(id):
            return "/api/v2/exerciseinfo/\(id)/"
    }
}
}
