//
//  ArticlesTableViewController.swift
//  NewsArticles
//
//  Created by Muhammad Adeel Ramzan on 10/06/2019.
//  Copyright © 2019 Muhammad Adeel Ramzan. All rights reserved.
//

import UIKit

class ArticlesTableViewController: UITableViewController {
    
    var searchText: String?
    var articleType: ArticleType?
    var articles = [NAArticle]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Articles"
        
        loadContent()
    }
    
    private func loadContent() {
        var url = kBaseUrl
        var requestType = RequestType.search
        
        if let type = articleType {
            var contentType = ""

            if type == .viewed {
                contentType = "viewed"
            } else if type == .shared {
                contentType = "shared"
            } else {
                contentType = "emailed"
            }

            url.append("mostpopular/v2/\(contentType)/7.json?api-key=\(kAPIKey)")
            requestType = .popular
        } else {
            if let searchText = searchText {
                url.append("search/v2/articlesearch.json?q=\(searchText)&api-key=\(kAPIKey)")
            }
        }
        
        NADataManager.getArticles(url: url, requestType: requestType, completion: { (articles) in
            if let articles = articles {
                self.articles.removeAll()
                self.articles.append(contentsOf: articles)
                self.tableView.reloadData()
            }
        })
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath)

        let article = articles[indexPath.row]
        
        if let _ = searchText {
            cell.textLabel?.text = article.abstract
            cell.detailTextLabel?.text = article.pubDate
        } else {
            cell.textLabel?.text = article.title
            cell.detailTextLabel?.text = article.publishedDate
        }
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
