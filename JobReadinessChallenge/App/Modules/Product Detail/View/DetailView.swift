//
//  DetailView.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 15/09/22.
//

import UIKit

class DetailView: UIView {
    
    private lazy var locationView: LocationView = {
        let view = LocationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var smallTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Product Name"
        label.font = .proximaNova12
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Product Name"
        label.font = .proximaNova16
        return label
    }()
    
    private lazy var sellerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Seller"
        label.font = .proximaNova11
        return label
    }()
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Cart Icon")
        return imageView
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "$21,000 MXN"
        label.font = .proximaNova36
        return label
    }()
    
    private lazy var firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.addArrangedSubview(askButton)
        stackView.addArrangedSubview(whatsappButton)
        return stackView
    }()
    
    private lazy var askButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Preguntar", for: .normal)
        button.backgroundColor = .mlBlue
        button.tintColor = .white
        button.layer.cornerRadius = 6
        return button
    }()
    
    private lazy var whatsappButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Whatsapp"
        configuration.image = UIImage(systemName: "paperclip")
        configuration.background.backgroundColor = .mlBlue
        configuration.imagePadding = 13.54
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 6
        return button
    }()
    
    private lazy var secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.addArrangedSubview(favoriteButton)
        stackView.addArrangedSubview(shareButton)
        return stackView
    }()
    
    private lazy var favoriteButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Agregar a favoritos"
        configuration.image = UIImage(systemName: "heart")
        configuration.imagePadding = 9.89
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.title = "Compartir"
        configuration.image = UIImage(named: "share")
        configuration.imagePadding = 7.2
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Descripción"
        label.font = UIFont.proximaNova16
        return label
    }()
    
    private lazy var descriptionContent: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Descripción Content"
        label.font = UIFont.proximaNova12
        label.numberOfLines = 0
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
    
    //MARK: - Setup View
    
    private func setupView(){
        self.addSubview(locationView)
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(smallTitleLabel)
        contentView.addSubview(mainTitleLabel)
        contentView.addSubview(sellerLabel)
        contentView.addSubview(productImageView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(firstStackView)
        contentView.addSubview(secondStackView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(descriptionContent)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            locationView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            locationView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            locationView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: locationView.bottomAnchor, constant: 0),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            smallTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            smallTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            smallTitleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            mainTitleLabel.topAnchor.constraint(equalTo: smallTitleLabel.bottomAnchor, constant: 6),
            mainTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            mainTitleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            sellerLabel.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant: 4),
            sellerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sellerLabel.heightAnchor.constraint(equalToConstant: 18),
            
            productImageView.topAnchor.constraint(equalTo: sellerLabel.bottomAnchor, constant: 24),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            productImageView.heightAnchor.constraint(equalToConstant: 275),
            
            priceLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 24),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            priceLabel.heightAnchor.constraint(equalToConstant: 45),
            
            firstStackView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 25),
            firstStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            firstStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            askButton.heightAnchor.constraint(equalToConstant: 48),
            askButton.widthAnchor.constraint(equalToConstant: 167),
            
            whatsappButton.heightAnchor.constraint(equalToConstant: 48),
            whatsappButton.widthAnchor.constraint(equalToConstant: 167),
            
            secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 34),
            secondStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            secondStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            favoriteButton.heightAnchor.constraint(equalToConstant: 18),
            
            shareButton.heightAnchor.constraint(equalToConstant: 18),
            
            descriptionLabel.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 58),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionContent.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 43),
            descriptionContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])
    }
}
