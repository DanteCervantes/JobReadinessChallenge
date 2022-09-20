//
//  CategoryCollectionViewCell.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "cell"
    
    //MARK: - View Code
    private lazy var imageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 28
        
        view.addSubview(categoryImageView)
        return view
    }()
    
    private lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .proximaNova10
        label.textColor = .lightGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Cell
    func setupCell(imageName: String, title: String){
        categoryImageView.image = UIImage(named: imageName)
        titleLabel.text = title
    }
    
    //MARK: Setup View
    
    private func setupView(){
        self.contentView.addSubview(imageContainer)
        self.contentView.addSubview(titleLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            imageContainer.heightAnchor.constraint(equalToConstant: 56),
            imageContainer.widthAnchor.constraint(equalToConstant: 56),
            
            categoryImageView.widthAnchor.constraint(equalToConstant: 24),
            categoryImageView.heightAnchor.constraint(equalToConstant: 24),
            categoryImageView.centerYAnchor.constraint(equalTo: imageContainer.centerYAnchor),
            categoryImageView.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor),
            
            titleLabel.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            titleLabel.centerXAnchor.constraint(equalTo: imageContainer.centerXAnchor)
        ])
    }
}
