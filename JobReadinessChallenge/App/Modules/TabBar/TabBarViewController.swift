//
//  TabBarViewController.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 12/09/22.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    private lazy var searchTextField: SearchTextField = {
        let textField = SearchTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = "test"
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    //Setup UI
    
    private func setupTabBar(){
        
        let mainVC = UINavigationController(rootViewController: MainViewController())
        mainVC.tabBarItem = UITabBarItem(title: "Inicio", image: UIImage(systemName: "house"), selectedImage: nil)
        
        let moreVC = UINavigationController(rootViewController: MoreViewController())
        moreVC.tabBarItem = UITabBarItem(title: "Más", image: UIImage(systemName: "text.justify"), selectedImage: nil)
        
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        viewControllers = [mainVC, moreVC]
    }
}
