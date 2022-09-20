//
//  PrimaryButton.swift
//  JobReadinessChallenge
//
//  Created by Dante Cervantes on 15/09/22.
//

import UIKit

class PrimaryButton: UIButton {
    
    var text: String? {
        didSet {
            primaryButton.setTitle(text, for: .normal)
        }
    }
    
    //MARK: - View Code
    private lazy var primaryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .mlBlue
        button.tintColor = .white
        button.layer.cornerRadius = 6
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup View
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            primaryButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}
