//
//  AlamoAPIClient.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import Foundation
import Alamofire

class AlamofireAPIClient {
    
    let headers: HTTPHeaders = [.authorization(bearerToken: "APP_USR-1462408046297250-091412-e12275cc350f1ef65ee22c4ddea6d14a-433416088")]
    
    func get(url: String, completion: @escaping
    (Result<Data?, AFError>) -> Void) {
        AF.request(url, headers: headers).response { response in
            completion(response.result)
        }
    }
}
