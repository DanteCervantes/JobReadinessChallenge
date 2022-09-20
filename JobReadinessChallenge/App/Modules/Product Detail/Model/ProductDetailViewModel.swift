//
//  ProductDetailViewModel.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 20/09/22.
//

import Foundation

class ProductDetailViewModel {
        
    private let userDefaults = UserDefaults()
    private let favoriteItemsKey = "favItems"
    private var favoriteProducts: [String]?
    
    init(){
        favoriteProducts = userDefaults.value(forKey: favoriteItemsKey) as? [String]
    }
    
    func isFavoriteItem(productId: String) -> Bool {
        guard let items = favoriteProducts else {
            return false
        }
        return items.contains(productId)
    }
    
    func addItemToFavorites(productId: String){
        favoriteProducts?.append(productId)
        userDefaults.set(favoriteProducts, forKey: favoriteItemsKey)
    }
    
    func deleteItemToFavorites(productId: String) {
        let itemIndex = favoriteProducts?.firstIndex(of: productId)
        favoriteProducts?.remove(at: itemIndex!)
        userDefaults.set(favoriteProducts, forKey: favoriteItemsKey)
    }
}

