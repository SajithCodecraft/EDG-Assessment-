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
        ScrollView {
            LazyVGrid(columns:[GridItem(.flexible()), GridItem(.flexible())], alignment: .center, spacing: 10) {
                ForEach(viewModel.products, id: \.id) { product in
                    NavigationLink {
                        ProductDetailView(isFromFavourites: false, product: product)
                    } label: {
                        ListItemView(product: product, isFromFavourites: false)
                    }
                }
            }
            .background(Color(white: 0.9))
        }.onAppear {
                viewModel.fetchProducts()
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(viewModel: ProductListViewModel())
    }
}
