//
//  AlamoAPIClient.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import Foundation
import Alamofire

class AlamofireAPIClient {
    
    let headers: HTTPHeaders = [.authorization(bearerToken: "APP_USR-1462408046297250-092109-39a0de4de6be4c44447e8f72f5c7f4d9-433416088")]
    
    func get(url: String, completion: @escaping
    (Result<Data?, AFError>) -> Void) {
        AF.request(url, headers: headers).response { response in
            completion(response.result)
        }
    }
}
