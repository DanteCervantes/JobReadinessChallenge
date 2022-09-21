//
//  FavoritesViewModel.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 20/09/22.
//

import Foundation

class FavoritesViewModel {
    
    private let searchService: SearchService
    private let favoriteItemsKey = "favItems"
    private var favoriteProducts: [String]?
    
    init(service: SearchService){
        favoriteProducts = UserDefaults.standard.array(forKey: "favoriteProducts") as? [String]
        self.searchService = service
    }
    
    func getProductDetail(completition: @escaping([ProductDetail]) -> Void, onError: @escaping (String) -> Void){
        let ids = getIds(favoriteItems: favoriteProducts!)
        guard ids != "Aun no hay productos agregados a favoritos" else {
            onError("Aun no hay productos agregados a favoritos")
            return
        }
        searchService.getProductsDetail(ids: getIds(favoriteItems: favoriteProducts!)) { products in
            completition(products)
        } onError: { error in
            onError(error)
        }
    }
    
    private func getIds(favoriteItems: [String]) -> String{
        guard favoriteItems.count > 0 else {
            return "Aun no hay productos agregados a favoritos"
        }
        
        var ids = ""
        for product in favoriteItems {
            ids += "\(product),"
        }
        return String(ids.trimmingCharacters(in: .whitespaces).dropLast())
    }
}

