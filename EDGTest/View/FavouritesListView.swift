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
        ScrollView {
            LazyVGrid(columns:[GridItem(.flexible()), GridItem(.flexible())], alignment: .center, spacing: 10) {
                ForEach(viewModel.products, id: \.id) { product in
                    NavigationLink {
                        ProductDetailView(isFromFavourites: true, product: product)
                    } label: {
                        ListItemView(product: product, isFromFavourites: true)
                    }                }
            }
            .background(Color(white: 0.9))
        }.onAppear {
                viewModel.fetchFavouritesProducts()
        }
    }
}

struct FavouritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesListView(viewModel: FavouritesViewModel())
    }
}
