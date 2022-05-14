//
//  ViewController.swift
//  PasswordReseter
//
//  Created by Kirill Sytkov on 13.05.2022.
//

import UIKit

class ViewController: UIViewController {

    let newPasswordTextFiled = PasswordTextField(placeHolder: "New password")
    
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

}

extension ViewController {
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        newPasswordTextFiled.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func layout() {
        stackView.addArrangedSubview(newPasswordTextFiled)

        view.addSubview(stackView)
 
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            
//            newPasswordTextFiled.leadingAnchor.constraint(equalToSystemSpacingAfter: stackView.leadingAnchor, multiplier: 1),
//            stackView.trailingAnchor.constraint(equalToSystemSpacingAfter: newPasswordTextFiled.trailingAnchor, multiplier: 1),
//            newPasswordTextFiled.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
        ])
    }
}
