//
//  ContentView.swift
//  EDGTest
//
//  Created by sajith on 02/01/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProductListView(viewModel: ProductListViewModel())
                .tabItem {
                Image(systemName: "cart")
                Text("Product List")
            }
            FavouritesListView(viewModel: FavouritesViewModel())
                .tabItem {
                Image(systemName: "heart")
                Text("Favorites")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
