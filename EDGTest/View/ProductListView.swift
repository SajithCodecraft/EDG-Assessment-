//
//  ProductListView.swift
//  EDGTest
//
//  Created by sajith on 02/01/23.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel: ProductListViewModel

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
            viewModel.fetchProducts()
        }
        .navigationBarTitle("Product List")
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(viewModel: ProductListViewModel())
    }
}
