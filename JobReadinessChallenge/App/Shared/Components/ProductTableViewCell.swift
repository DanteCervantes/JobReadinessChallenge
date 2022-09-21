//
//  ProductTableViewCell.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    static let cellId = "cell"
    
    
    var showFavButton: Bool? {
        didSet {
            if showFavButton == false {
                favButton.isHidden = true
            }
        }
    }
    
    var product: ProductDetail? {
        didSet{
            productNameLabel.text = product?.body.title
            let formatter = NumberFormatter()
            formatter.locale = Locale.current
            formatter.numberStyle = .currency
            if let formattedAmount = formatter.string(for: product?.body.price) {
                productPriceLabel.text = formattedAmount
            }
            productImageView.loadFrom(URLAddress: (product?.body.secure_thumbnail)!)
        }
    }
    
    //MARK: - View Code
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 4
        imageView.addSubview(favButton)
        return imageView
    }()
    
    private lazy var favButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 14.5
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.backgroundColor = .white
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [productNameLabel,productPriceLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 2
        return stackView
    }()
    
    private lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.proximaNova13
        return label
    }()
    
    private lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.proximaNova20
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup View
    private func setupView(){
        addSubview(productImageView)
        addSubview(stackView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            productImageView.heightAnchor.constraint(equalToConstant: 131),
            productImageView.widthAnchor.constraint(equalToConstant: 131),
            productImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            productImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11),
            
            favButton.heightAnchor.constraint(equalToConstant: 29),
            favButton.widthAnchor.constraint(equalToConstant: 29),
            favButton.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: -6),
            favButton.topAnchor.constraint(equalTo: productImageView.topAnchor, constant: 6),
            
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            stackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 11),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -11).self
        ])
    }
}
