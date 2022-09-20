//
//  MenuViewController.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 19/09/22.
//

import UIKit

class MenuViewController: UIViewController {
    
    //MARK: - View Code
    private lazy var menuView: MenuView = {
        let view = MenuView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
            
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        menuView.delegate = self
    }
    
    //MARK: - Setup View
    private func setupView(){
        self.view.addSubview(menuView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            menuView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            menuView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            menuView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
        ])
    }
}

//MARK: - MenuViewDelegate
extension MenuViewController: MenuViewDelegate {
    func didPressFavorites() {
        self.navigationController?.pushViewController(FavoriteTableViewController(), animated: true)
    }
}
