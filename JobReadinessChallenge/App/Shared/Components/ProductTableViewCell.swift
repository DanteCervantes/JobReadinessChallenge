//
//  ProductTableViewCell.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 13/09/22.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    static let cellId = "cell"
    
    var product: ProductDetail? {
        didSet{
            productNameLabel.text = product?.body.title
            productPriceLabel.text = "$\(product?.body.price ?? 0)"
            productDescriptionLabel.text = ""
            productImageView.loadFrom(URLAddress: (product?.body.secure_thumbnail)!)
        }
    }
    
    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [productNameLabel,productPriceLabel,productDescriptionLabel])
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
    
    private lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.proximaNova11
        label.textColor = .lightGray
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
            
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            stackView.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 11),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
            
        ])
    }
}
