//
//  ProductDetailView.swift
//  EDGTest
//
//  Created by sajith on 02/01/23.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product

    var body: some View {
        VStack(alignment: .leading) {
            Image(product.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(product.title)
                .font(.title)
            if let price = product.price.first?.value, let priceStr = String(price) {
                Text(priceStr)
                    .font(.headline)
            }
            Spacer()
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


//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView(product: <#Product#>)
//    }
//}
