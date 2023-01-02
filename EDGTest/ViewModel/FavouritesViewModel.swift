//
//  FavouritesViewModel.swift
//  EDGTest
//
//  Created by sajith on 02/01/23.
//

import Foundation

class FavouritesViewModel: ObservableObject {
    private let storageManager: StorageManager = StorageManager()
    @Published var products = [Product]()

    func fetchFavouritesProducts() {
        products = storageManager.array(forKey: "favourites") ?? []
    }
    
    func addToFavourites(product: Product) {
        var favourites: [Product] = storageManager.array(forKey: "favourites") ?? []
        favourites.append(product)
        storageManager.save(array: favourites, forKey: "favourites")
        products = favourites
    }
    
    func removeFromFavourites(product: Product) {
        var favourites: [Product] = storageManager.array(forKey: "favourites") ?? []
        favourites = favourites.filter { $0.id != product.id }
        storageManager.save(array: favourites, forKey: "favourites")
        products = favourites
    }
}
