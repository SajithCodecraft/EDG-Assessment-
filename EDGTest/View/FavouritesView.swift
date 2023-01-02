//
//  FavouritesView.swift
//  EDGTest
//
//  Created by sajith on 02/01/23.
//

import SwiftUI

struct FavoritesView: View {
    @State var products: [Product] = []

    var body: some View {
        List {
            ForEach(products, id: \.id) { product in
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
                        // delete product from favorites
                    }) {
                        Image(systemName: "heart.slash")
                    }
                }
            }
        }
        .navigationBarTitle("Favorites")
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}


