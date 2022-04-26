//
//  FrendsViewController.swift
//  TheMessenger
//
//  Created by Максим Боталов on 25.04.2022.
//

import UIKit

class FrendsViewController: UIViewController {
    
    var colletctionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupCollectionView()
//        setupConstraints()
        view.backgroundColor = .white
        title = "Frends"
    }
    
    private func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    private func setupCollectionView() {
        colletctionView = UICollectionView(frame: view.bounds, collectionViewLayout: setupCompositionalLayout())
        colletctionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        colletctionView.backgroundColor = .white
        view.addSubview(colletctionView)
        colletctionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        colletctionView.delegate = self
        colletctionView.dataSource = self
    }
    
    private func setupCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(84))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 0, bottom: 10, trailing: 0)

            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 10, bottom: 0, trailing: 10)
            return section
        }
        return layout
    }
}

extension FrendsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        cell.backgroundColor = .red
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.systemBlue.cgColor
        return cell
    }
    
    
}

// MARK: - UISearchBarDelegate
extension FrendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

// MARK: - Setup Constraints
extension FrendsViewController {
    private func setupConstraints() {
        colletctionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        colletctionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        colletctionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
}
