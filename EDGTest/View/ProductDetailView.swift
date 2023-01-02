//
//  ProductDetailView.swift
//  EDGTest
//
//  Created by sajith on 02/01/23.
//

import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject var viewModel: ProductListViewModel
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
            HStack(spacing: 10) {
                Button(action: {
                    // Add product to cart
                }) {
                    Text("Add to Cart")
                }
                Button(action: {
                    viewModel.addToFavourites(product: product)
                }) {
                    Image(systemName: "heart")
                }
            }
        }
        .padding()
        .navigationBarTitle(Text(product.title), displayMode: .inline)
        .navigationBarItems(trailing:
            Button(action: {
                // toggle favorite status for product
            }) {
                Image(systemName: "heart")
            }
        )
    }
}
