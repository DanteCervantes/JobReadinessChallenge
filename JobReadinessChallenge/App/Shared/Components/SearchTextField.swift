//
//  SearchTextField.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 12/09/22.
//

import UIKit

class SearchTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 38, bottom: 0, right: 5)
    
    var icon: UIImage? {
        didSet {
            iconView.image = icon
        }
    }
    
    var iconColor: UIColor? {
        didSet {
            iconView.tintColor = iconColor
        }
    }
    
    //MARK: View Code
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        customLeftView.addSubview(imageView)
        return imageView
    }()
    
    private lazy var customLeftView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Methods to override
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: View Build
    private func setupView(){
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.font = UIFont.systemFont(ofSize: 14)
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        self.leftView = customLeftView
        self.leftViewMode = .always
        self.placeholder = "Buscar en Mercado Libre"
        self.font = .proximaNova
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            iconView.heightAnchor.constraint(equalToConstant: 14.65),
            iconView.widthAnchor.constraint(equalToConstant: 14.65),
            customLeftView.heightAnchor.constraint(equalToConstant: 14.65),
            customLeftView.widthAnchor.constraint(equalToConstant: 14.65),
            iconView.leadingAnchor.constraint(equalTo: customLeftView.leadingAnchor, constant: 10),

            self.heightAnchor.constraint(equalToConstant: 30),
            self.widthAnchor.constraint(equalToConstant: 303)
        ])
    }
}
