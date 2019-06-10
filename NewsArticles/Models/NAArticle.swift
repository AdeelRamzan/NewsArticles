//
//  NAArticle.swift
//  NewsArticles
//
//  Created by Muhammad Adeel Ramzan on 10/06/2019.
//  Copyright © 2019 Muhammad Adeel Ramzan. All rights reserved.
//

import Foundation

struct NAArticleRoot: Codable {
    var results: [NAArticle]?
    var response: NADocs?
}

struct NAArticle: Codable {
    var title: String?
    var publishedDate: String?
    var abstract: String?
    var pubDate: String?
}

struct NADocs: Codable {
    var docs: [NAArticle]
}
