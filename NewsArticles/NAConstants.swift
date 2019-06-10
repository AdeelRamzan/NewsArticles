//
//  NAConstants.swift
//  NewsArticles
//
//  Created by Muhammad Adeel Ramzan on 10/06/2019.
//  Copyright © 2019 Muhammad Adeel Ramzan. All rights reserved.
//

import Foundation

let kAPIManager = NAAPIManager.shared
let kBaseUrl = "https://api.nytimes.com/svc/"
let kAPIKey = "BGHRXFsGFFDsMYUfkMoRRuV3DPDp92qr"

enum RequestType: Int {
    case search
    case popular
}

enum ArticleType: Int {
    case viewed
    case shared
    case emailed
}
