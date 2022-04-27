//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Kirill Sytkov on 27.04.2022.
//
import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension OnboardingViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "delorean")
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment  = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.text = "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989."
        
       
    }
    
    func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)

        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
        
    }
}

