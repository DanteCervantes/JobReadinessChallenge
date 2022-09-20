//
//  MenuView.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 19/09/22.
//

import UIKit

class MenuView: UIView {
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .mlYellow
        return view
    }()
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.fill")
        imageView.layer.cornerRadius = 27
        imageView.layer.borderWidth = 4
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        return imageView
    }()
    
    private lazy var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hola Nombre Usuario"
        label.font = .proximaNova14
        return label
    }()
    
    private lazy var mlLevelLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nivel 3 - Mercado Puntos >"
        label.font = .proximaNova14
        return label
    }()
    
    private lazy var mercadoPagoButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Mercado Pago"
        configuration.image = UIImage(named: "mercadoPago")
        configuration.imagePadding = 12
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        button.backgroundColor = .mlSecondaryYellow
        button.tintColor = .black
        return button
    }()
    
    private lazy var menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let menuService = MenuService()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup View
    
    private func setupView(){
        self.addSubview(headerView)
        headerView.addSubview(profileImageView)
        headerView.addSubview(userLabel)
        headerView.addSubview(mlLevelLabel)
        headerView.addSubview(mercadoPagoButton)
        self.addSubview(menuTableView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 157),
            headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            
            profileImageView.heightAnchor.constraint(equalToConstant: 54),
            profileImageView.widthAnchor.constraint(equalToConstant: 54),
            profileImageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            profileImageView.topAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.topAnchor , constant: 50),
            
            userLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            userLabel.topAnchor.constraint(equalTo: headerView.safeAreaLayoutGuide.topAnchor, constant: 58),
            
            mlLevelLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 20),
            mlLevelLabel.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 5),
            
            mercadoPagoButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 9),
            mercadoPagoButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -9),
            mercadoPagoButton.heightAnchor.constraint(equalToConstant: 34),
            mercadoPagoButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 14),
            
            menuTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0),
            menuTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            menuTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            menuTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension MenuView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuService.getMenuCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as! MenuTableViewCell
        cell.setupCell(iconName: menuService.menuItems[indexPath.item].iconName, title: menuService.menuItems[indexPath.item].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.item == 4 else {
            return
        }
        print(menuService.menuItems[indexPath.item].title)
    }
}
