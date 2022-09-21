//
//  TabBarViewController.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 12/09/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar(){
        
        let mainVC = UINavigationController(rootViewController: MainViewController())
        mainVC.tabBarItem = UITabBarItem(title: "Inicio", image: UIImage(systemName: "house"), selectedImage: nil)
        
        let menuVC = UINavigationController(rootViewController: MenuViewController())
        menuVC.tabBarItem = UITabBarItem(title: "Más", image: UIImage(systemName: "text.justify"), selectedImage: nil)
        
        let favVC = UINavigationController(rootViewController: FavoriteTableViewController())
        favVC.tabBarItem = UITabBarItem(title: "Favoritos", image: UIImage(systemName: "heart"), selectedImage: nil)
        
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        viewControllers = [mainVC, favVC, menuVC]
    }
}
