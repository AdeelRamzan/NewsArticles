//
//  NADataManager.swift
//  NewsArticles
//
//  Created by Muhammad Adeel Ramzan on 10/06/2019.
//  Copyright © 2019 Muhammad Adeel Ramzan. All rights reserved.
//

import Foundation

class NADataManager {
    
    class func getArticles(url: String, requestType: RequestType, completion: @escaping ((_ articles: [NAArticle]?) -> ())) {
        kAPIManager.get(url: url, parameters: nil) { (response) in
            if let result = response.result.value?.utf8 {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do {
                    let root = try decoder.decode(NAArticleRoot.self, from: Data(result))
                    
                    if requestType == .search {
                        completion(root.response?.docs)
                    } else {
                        completion(root.results)
                    }
                } catch {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }
    
    class func getGif(url: String, completion: @escaping ((_ data: Data?) -> ())) {
        kAPIManager.get(url: url, parameters: nil) { (response) in
            completion(response.data)
        }
    }
}
