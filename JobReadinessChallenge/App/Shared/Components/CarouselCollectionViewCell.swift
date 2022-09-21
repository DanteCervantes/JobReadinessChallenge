//
//  CarouselCollectionViewCell.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 19/09/22.
//

import UIKit

class CarouselCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "carouselCell"
    
    //MARK: - View Code
    private lazy var imageContainer: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
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
    func setupCell(imageUrl: String){
        imageContainer.loadFrom(URLAddress: imageUrl)
    }
    
    //MARK: - SetupView
    
    private func setupView(){
        self.contentView.addSubview(imageContainer)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            imageContainer.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            imageContainer.widthAnchor.constraint(equalTo: self.contentView.widthAnchor)
        ])
    }
}
