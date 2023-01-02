//
//  ListItemView.swift
//  EDGTest
//
//  Created by sajith on 02/01/23.
//

import SwiftUI

struct ListItemView: View {
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
                        let viewModel = FavouritesViewModel()
                        if product.isFavourites {
                            viewModel.removeFromFavourites(product: product)
                        } else {
                            viewModel.addToFavourites(product: product)
                        }
                    } else {
                        let viewModel = ProductListViewModel()
                        if product.isFavourites {
                            viewModel.removeFromFavourites(product: product)
                        } else {
                            viewModel.addToFavourites(product: product)
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
