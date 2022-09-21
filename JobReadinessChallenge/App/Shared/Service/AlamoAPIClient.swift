//
//  AlamoAPIClient.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import Foundation
import Alamofire

class AlamofireAPIClient {
    
    let headers: HTTPHeaders = [.authorization(bearerToken: UserDefaults.standard.string(forKey: "AuthToken")!)]
    
    func get(url: String, completion: @escaping
    (Result<Data?, AFError>) -> Void) {
        AF.request(url, headers: headers).response { response in
            completion(response.result)
        }
    }
}
