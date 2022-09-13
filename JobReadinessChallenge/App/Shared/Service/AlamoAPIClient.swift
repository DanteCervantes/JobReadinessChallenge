//
//  AlamoAPIClient.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import Foundation
import Alamofire

class AlamofireAPIClient {
    func get(url: String, completion: @escaping
    (Result<Data?, AFError>) -> Void) {
        
        AF.request(url).response { response in
            completion(response.result)
        }
    }
}
