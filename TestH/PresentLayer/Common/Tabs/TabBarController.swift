//
//  TabBarController.swift
//  TestH
//
//  Created by sherbakova on 15.08.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    let tabBarView = TabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        selectedIndex = 0
        tabBarView.configureTabsIcons(names: ["numerology", "list"])
        setupTabBar()
    }
}

private extension TabBarController {
    
    func setupTabBar() {
        tabBar.isHidden = true // hide original tabBar
        
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabBarView)

        NSLayoutConstraint.activate([
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        tabBarView.onItemTapped = { [weak self] index in
            self?.selectedIndex = index
        }
    }
}

