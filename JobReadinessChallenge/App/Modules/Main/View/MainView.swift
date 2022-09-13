//
//  Main View.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 12/09/22.
//

import UIKit

class MainView: UIView {
    
    private lazy var locationView: LocationView = {
        let view = LocationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
#warning("gradient")
    private lazy var bannerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .mlYellow
        view.addSubview(bannerImageView)
        return view
    }()
    
    private lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "banner")
        return imageView
    }()
    
    private lazy var shippingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 2)
        view.layer.shadowOpacity = 1.0
        view.addSubview(truckImageView)
        view.addSubview(shippingLabel)
        return view
    }()
    
    private lazy var truckImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "truck")
        return imageView
    }()
    
    private lazy var shippingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        var myMutableString = NSMutableAttributedString(string: "Envio gratis en millones de productos desde $299", attributes: [NSAttributedString.Key.font : UIFont.proximaNova12])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 0.00, green: 0.65, blue: 0.31, alpha: 1.00), range: NSRange(location:0,length:12))
        label.attributedText = myMutableString
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
    
    private func setupView(){
        self.addSubview(locationView)
        self.addSubview(bannerView)
        self.addSubview(shippingView)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            locationView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            locationView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            bannerView.topAnchor.constraint(equalTo: locationView.bottomAnchor, constant: 0),
            bannerView.heightAnchor.constraint(equalToConstant: 203),
            bannerView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            bannerImageView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 12),
            bannerImageView.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -12),
            bannerImageView.heightAnchor.constraint(equalToConstant: 169),
            bannerImageView.topAnchor.constraint(equalTo: bannerView.topAnchor, constant: 30),
            
            shippingView.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 5),
            shippingView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            shippingView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            shippingView.heightAnchor.constraint(equalToConstant: 24),
            
            truckImageView.heightAnchor.constraint(equalToConstant: 12),
            truckImageView.widthAnchor.constraint(equalToConstant: 15.75),
            truckImageView.leadingAnchor.constraint(equalTo: shippingView.leadingAnchor, constant: 22.12),
            truckImageView.centerYAnchor.constraint(equalTo: shippingView.centerYAnchor),
            
            shippingLabel.leadingAnchor.constraint(equalTo: shippingView.leadingAnchor, constant: 44),
            shippingLabel.trailingAnchor.constraint(equalTo: shippingView.trailingAnchor, constant: -7),
            shippingLabel.centerYAnchor.constraint(equalTo: shippingView.centerYAnchor)
        ])
    }
}
