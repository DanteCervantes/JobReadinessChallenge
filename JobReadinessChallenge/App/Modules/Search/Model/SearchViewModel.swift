//
//  SearchViewModel.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import Foundation

class SearchViewModel {
    
    private let productService: ProductService
    var products = [ProductDetail]()
    
    init(service: ProductService){
        self.productService = service
    }
    
    func getCategoryId(product: String, completition: () -> Void){
        productService.getCategory(product: product) { categoryId in
            self.getTopProducts(categoryId: categoryId) { topProducts in
                let ids = self.getIds(topProducts: topProducts)
                self.getProductsDetail(for: ids)
            }
        }
    }
    
    private func getTopProducts(categoryId: String, completition: @escaping (TopProducts) -> Void){
        productService.getTopTwentyByCategory(categoryId: categoryId) { topProducts in
            completition(topProducts)
        }
    }
    
    private func getIds(topProducts: TopProducts) -> String{
        var ids = ""
        for product in topProducts.content {
            ids += "\(product.id),"
        }
        return String(ids.trimmingCharacters(in: .whitespaces).dropLast())
    }
    
    private func getProductsDetail(for ids: String){
        productService.getProductsDetail(ids: ids) { products in
            self.products = products
        }
    }
    
    func getProductsCount() -> Int {
        products.count ?? 0
    }
}
