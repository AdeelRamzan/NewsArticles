//
//  SearchViewController.swift
//  NewsArticles
//
//  Created by Muhammad Adeel Ramzan on 10/06/2019.
//  Copyright © 2019 Muhammad Adeel Ramzan. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search"
    }
    
    @IBAction func search(_ sender: Any) {
        if let searchText = searchTextField.text, searchText.trimmingCharacters(in: .whitespacesAndNewlines).count > 0, let articlesTVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "articles") as? ArticlesTableViewController {
            searchTextField.resignFirstResponder()
            
            articlesTVC.searchText = searchText
            navigationController?.pushViewController(articlesTVC, animated: true)
        }
    }
}
