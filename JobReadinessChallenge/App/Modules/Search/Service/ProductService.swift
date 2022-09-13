//
//  ApiService.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import Foundation

class ProductService {
    
    let apiClient = AlamofireAPIClient()
    
    func getCategory(product: String){
        let apiURL = "https://api.mercadolibre.com/sites/MLM/domain_discovery/search?limit=1&q=\(product)"
        apiClient.get(url: apiURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let category = try JSONDecoder().decode(MlCategory.self, from: data)
                        print(category)
                    }
                } catch {
                    print("Error")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
