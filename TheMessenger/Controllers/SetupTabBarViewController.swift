//
//  SetupTabBarViewController.swift
//  TheMessenger
//
//  Created by Максим Боталов on 25.04.2022.
//

import UIKit

class SetupTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let frendsViewControlle = creationNavigationController(viewController: FrendsViewController(), nameItem: "Frends", nameImageItem: "person.2")
        let chatsViewController = creationNavigationController(viewController: ChatsViewController(), nameItem: "Chats", nameImageItem: "message")
        
        viewControllers = [frendsViewControlle, chatsViewController]
        
    }
    
    private func creationNavigationController(viewController: UIViewController, nameItem: String, nameImageItem: String) -> UINavigationController {
        let item = UITabBarItem(title: nameItem, image: UIImage(systemName: nameImageItem), tag: 0)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item
        navigationController.navigationBar.prefersLargeTitles = false
        return navigationController
    }
}
