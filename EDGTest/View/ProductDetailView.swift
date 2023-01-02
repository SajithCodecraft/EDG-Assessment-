//
//  ProductDetailView.swift
//  EDGTest
//
//  Created by sajith on 02/01/23.
//

import SwiftUI

struct ProductDetailView: View {
    let isFromFavourites: Bool
    var product: Product

    var body: some View {
        VStack() {
            AsyncImage(url: URL(string: product.imageURL)!)
                .foregroundColor(.white)
            Text(product.title)
                .bold()
                .lineLimit(2)
                .multilineTextAlignment(.center)
            if let price = product.price.first?.value, let priceStr = String(price) {
                    Text(priceStr + "$")
                    .bold()
                    .multilineTextAlignment(.center)
            }
           
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
        }
        .lineSpacing(16)
        .padding()
        .navigationBarTitle(Text(product.title), displayMode: .inline)
        .navigationBarItems(trailing:
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
        )
    }
}
