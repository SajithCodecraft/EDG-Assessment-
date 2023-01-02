//
//  ListItemView.swift
//  EDGTest
//
//  Created by sajith on 02/01/23.
//

import SwiftUI

struct ListItemView: View {
    @EnvironmentObject var productListViewModel: ProductListViewModel
    @EnvironmentObject var favouritesViewModel: FavouritesViewModel
    let product: Product
    let isFromFavourites: Bool
    
    var body: some View {
        VStack() {
            AsyncImage(url: URL(string: product.imageURL)!)
                .foregroundColor(.white)
            Text(product.title)
                .bold()
                .lineLimit(1)
                .multilineTextAlignment(.center)
            if let price = product.price.first?.value, let priceStr = String(price) {
                    Text(priceStr + "$")
                    .bold()
                    .multilineTextAlignment(.center)
            }
            HStack(spacing: 20) {
                
                Button(action: {
                    // Add product to cart
                }) {
                    Text("Add to Cart")
                        .foregroundColor(.white)
                        .padding()
                        .bold()
                        .background(Color.blue)
                        .cornerRadius(4)
                }
                Button(action: {
                    if isFromFavourites {
                        if product.isFavourites {
                            favouritesViewModel.removeFromFavourites(product: product)
                        } else {
                            favouritesViewModel.addToFavourites(product: product)
                        }
                    } else {
                        if product.isFavourites {
                            productListViewModel.removeFromFavourites(product: product)
                        } else {
                            productListViewModel.addToFavourites(product: product)
                        }
                    }
                    
                }) {
                    Image(systemName: product.isFavourites ? "heart.fill" : "heart")
                }
            }
        }
        .padding(10)
        .background(.white)
        .cornerRadius(10)
    }
}
