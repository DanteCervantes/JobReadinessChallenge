//
//  LocationView.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 12/09/22.
//

import UIKit

class LocationView: UIView {
    
    private lazy var addresLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enviar a Nombre de Usuario - Dirección >"
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Location Icon")
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
    
    private func setupView(){
        self.backgroundColor = .mlYellow
        self.addSubview(locationImageView)
        self.addSubview(addresLabel)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 40),
            
            locationImageView.heightAnchor.constraint(equalToConstant: 16),
            locationImageView.widthAnchor.constraint(equalToConstant: 16),
            locationImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            addresLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            addresLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 4)
        ])
    }
}
