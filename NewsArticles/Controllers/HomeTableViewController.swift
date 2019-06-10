//
//  HomeTableViewController.swift
//  NewsArticles
//
//  Created by Muhammad Adeel Ramzan on 10/06/2019.
//  Copyright © 2019 Muhammad Adeel Ramzan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if RequestType(rawValue: section) == .search {
            return 1
        } else {
            return 3
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if RequestType(rawValue: section) == .search {
            return "Search"
        } else {
            return "Popular"
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if RequestType(rawValue: indexPath.section) == .search {
            cell.textLabel?.text = "Search Articles"
        } else {
            if ArticleType(rawValue: indexPath.row) == .viewed {
                cell.textLabel?.text = "Most Viewed"
            } else if ArticleType(rawValue: indexPath.row) == .shared {
                cell.textLabel?.text = "Most Shared"
            } else {
                cell.textLabel?.text = "Most Emailed"
            }
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if RequestType(rawValue: indexPath.section) == .search {
            navigationController?.pushViewController(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "search"), animated: true)
        } else {
            if let articlesTVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "articles") as? ArticlesTableViewController {
                articlesTVC.articleType = ArticleType(rawValue: indexPath.row)
                navigationController?.pushViewController(articlesTVC, animated: true)
            }
        }
    }
}
