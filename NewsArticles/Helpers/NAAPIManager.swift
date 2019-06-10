//
//  NAAPIManager.swift
//  NewsArticles
//
//  Created by Muhammad Adeel Ramzan on 10/06/2019.
//  Copyright © 2019 Muhammad Adeel Ramzan. All rights reserved.
//

import Foundation
import Alamofire

class NAAPIManager: SessionManager {
    
    static let shared = NAAPIManager()
    
    func get(url: String, parameters: Parameters?, completion: @escaping ((_ response: DataResponse<String>) -> ())) {
        request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseString(completionHandler: { (response: DataResponse<String>) in
            completion(response)
        })
    }
}
