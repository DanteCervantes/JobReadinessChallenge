//
//  ApiService.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import Foundation
import UIKit

class ProductService {
    
    private let apiClient = AlamofireAPIClient()
    
    func getCategory(product: String,  completition: @escaping (String) -> Void){
        let apiURL = "https://api.mercadolibre.com/sites/MLM/domain_discovery/search?limit=1&q=\(product)"
        apiClient.get(url: apiURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let dataObject = try JSONDecoder().decode([MlCategory].self, from: data)
                        
                        guard dataObject.count > 0 else {
                            completition("Not Found")
                            return
                        }
            
                        completition(dataObject[0].category_id)
                    }
                } catch {
                    fatalError(String(data: data!, encoding: .utf8)!)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getTopTwentyByCategory(categoryId: String, completition: @escaping (TopProducts) -> Void){
        let apiURL = "https://api.mercadolibre.com/highlights/MLM/category/\(categoryId)"
        apiClient.get(url: apiURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let dataObject = try JSONDecoder().decode(TopProducts.self, from: data)
                        completition(dataObject)
                    }
                } catch {
                    fatalError(String(data: data!, encoding: .utf8)!)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getProductsDetail(ids: String, completition: @escaping ([ProductDetail]) -> Void){
        let apiURL = "https://api.mercadolibre.com/items?ids=\(ids)"
        apiClient.get(url: apiURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data{
                        let jsonData = try JSONDecoder().decode([ProductDetail].self, from: data)
                        completition(jsonData)
                    }
                } catch {

                    fatalError(String(data: data!, encoding: .utf8)!)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    func getProductDescription(product: String, completition: @escaping (String) -> Void){
        let apiURL = "https://api.mercadolibre.com/items/MLM1328587014/description"
        apiClient.get(url: apiURL) { response in
            switch response {
            case .success(let data):
                do{
                    if let data = data {
                        let jsonData = try JSONDecoder().decode(ProductDescription.self, from: data)
                        completition(jsonData.plain_text)
                    }
                } catch {
                    fatalError(String(data: data!, encoding: .utf8)!)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
