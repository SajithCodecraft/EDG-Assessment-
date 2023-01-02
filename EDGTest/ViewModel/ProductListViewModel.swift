//
//  ProductViewModel.swift
//  EDGTest
//
//  Created by sajith on 02/01/23.
//

import Foundation
import Combine

class ProductListViewModel: ObservableObject {
    private let storageManager: StorageManager = StorageManager()
    private let apiManager: NetworkManager = NetworkManager()
    private var cancellables = Set<AnyCancellable>()
    @Published var isLoading = false
    @Published var isFailed = false
    @Published var products = [Product]()

    func fetchProducts() {
        self.isLoading = true
        apiManager.fetchProducts().sink { [weak self] completion in
            self?.isLoading = false
            switch completion {
            case .failure(_):
                self?.isFailed = true
            case .finished:
                self?.isFailed = false
            }
        }
        receiveValue: { [weak self] (responseData: ProductList) in
            guard let proudcts = responseData.products else { return }
            self?.products = proudcts
        }.store(in: &cancellables)
    }
    
    func addToFavourites(product: Product) {
        var favourites: [Product] = storageManager.array(forKey: "favourites") ?? []
        favourites.append(product)
        storageManager.save(array: favourites, forKey: "favourites")
    }
    
    func removeFromFavourites(product: Product) {
        var favourites: [Product] = storageManager.array(forKey: "favourites") ?? []
        favourites = favourites.filter { $0.id != product.id }
        storageManager.save(array: favourites, forKey: "favourites")
    }
}
