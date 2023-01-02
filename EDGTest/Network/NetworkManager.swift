//
//  NetworkManager.swift
//  SwiftUISaMPLE
//
//  Created by sajith on 28/12/22.
//

import Foundation
import Combine

class NetworkManager: BaseNetworkManager {
    
    /**
     Fetch fetchProducts
     */
    func fetchProducts() -> Future<ProductList, Error> {
        let endpoint = AppFeed.productListing
        var request = endpoint.request
        request.method = HTTPMethod.get
        return fetch(request: request)
    }
}
