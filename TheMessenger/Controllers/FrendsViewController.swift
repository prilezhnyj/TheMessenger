//
//  FrendsViewController.swift
//  TheMessenger
//
//  Created by Максим Боталов on 25.04.2022.
//

import UIKit

struct MChat: Hashable, Decodable {
    var username: String
    var userImageString: String
    var lastMessage: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
}

class FrendsViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case waitingChats
        case activeChats
    }
    
    var colletctionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, MChat>?
    
    let activeChats = Bundle.main.decode([MChat].self, from: "activeChats.json")
    let waitingChats = Bundle.main.decode([MChat].self, from: "waitingChats.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupCollectionView()
        setupDataSource()
        reloadData()
        
//        setupConstraints()
        view.backgroundColor = .white
        title = "Frends"
    }
    
    private func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
    }
    
    private func setupDataSource() {
        func configure<T: SelfConfigurationCell>(cellType: T.Type, with value: MChat, for indexPath: IndexPath) -> T {
            guard let cell = colletctionView.dequeueReusableCell(withReuseIdentifier: cellType.id, for: indexPath) as? T else { fatalError("Unable to dequeue \(cellType)") }
            cell.configure(with: value)
            return cell
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, MChat>(collectionView: colletctionView, cellProvider: { (collectionView, indexPath, chat) -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Нет секции")}
            
            switch section {
            case .activeChats:
                return configure(cellType: ActiveChatCell.self, with: chat, for: indexPath)
                
            case .waitingChats:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "redCellID", for: indexPath)
                cell.backgroundColor = .systemRed
                return cell
            }
        })
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, MChat>()
        snapshot.appendSections([.waitingChats, .activeChats])
        snapshot.appendItems(waitingChats, toSection: .waitingChats)
        snapshot.appendItems(activeChats, toSection: .activeChats)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    private func setupCollectionView() {
        colletctionView = UICollectionView(frame: view.bounds, collectionViewLayout: setupCompositionalLayout())
        colletctionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        colletctionView.backgroundColor = .white
        view.addSubview(colletctionView)
        colletctionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "redCellID")
        colletctionView.register(ActiveChatCell.self, forCellWithReuseIdentifier: ActiveChatCell.id)
    }
    
    private func setupCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [self] (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            guard let section = Section(rawValue: sectionIndex) else { fatalError("Нет секции") }
            
            switch section {
            case .activeChats:
                return createActiveChats()
            case .waitingChats:
                return createWaitingChats()
            }
            
            
            
        }
        return layout
    }
    
    private func createWaitingChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(88), heightDimension: .absolute(88))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 10, bottom: 0, trailing: 10)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        return section
    }
    
    private func createActiveChats() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(88))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//        group.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 0, bottom: 10, trailing: 0)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
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
