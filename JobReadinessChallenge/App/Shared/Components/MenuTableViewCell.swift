//
//  TableViewCell.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 19/09/22.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    static let identifier = "MenuCell"
    
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .proximaNova14
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(iconName: String, title: String){
        icon.image = UIImage(systemName: iconName)
        titleLabel.text = title
    }
    
    //MARK: -SetupView
    
    private func setupView(){
        self.contentView.addSubview(icon)
        self.contentView.addSubview(titleLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: 20),
            icon.widthAnchor.constraint(equalToConstant: 20),
            icon.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30),
            icon.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 23),
            titleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
}
