//
//  FavouritesListView.swift
//  EDGTest
//
//  Created by sajith on 02/01/23.
//

import SwiftUI

struct FavouritesListView: View {
    @ObservedObject var viewModel: FavouritesViewModel

    var body: some View {
        List {
            ForEach(viewModel.products, id: \.id) { product in
                HStack {
                    Image(product.imageURL)
                        .resizable()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading) {
                        Text(product.title)
                            .font(.headline)
                        if let price = product.price.first?.value, let priceStr = String(price) {
                            Text(priceStr)
                                .font(.subheadline)
                        }
                    }
                    Spacer()
                    Button(action: {
                        // add product to cart
                    }) {
                        Image(systemName: "cart")
                    }
                    Button(action: {
                        // toggle favorite status for product
                    }) {
                        Image(systemName: "heart")
                    }
                }
            }
        }.onAppear {
            viewModel.fetchFavouritesProducts()
        }
        .navigationBarTitle("Product List")
    }
}

struct FavouritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesListView(viewModel: FavouritesViewModel())
    }
}
