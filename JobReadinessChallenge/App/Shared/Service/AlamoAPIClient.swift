//
//  AlamoAPIClient.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import Foundation
import Alamofire

class AlamofireAPIClient {
    
    let headers: HTTPHeaders = [.authorization(bearerToken: "APP_USR-1462408046297250-091911-2f06ed25767d01745293118f5b39c1ce-433416088")]
    
    func get(url: String, completion: @escaping
    (Result<Data?, AFError>) -> Void) {
        AF.request(url, headers: headers).response { response in
            completion(response.result)
        }
    }
}
