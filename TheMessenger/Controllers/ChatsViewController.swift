//
//  ChatsViewController.swift
//  TheMessenger
//
//  Created by Максим Боталов on 25.04.2022.
//

import UIKit

class ChatsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        view.backgroundColor = .white
        title = "Chats"
    }
}

extension ChatsViewController {
    private func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
}

extension ChatsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
