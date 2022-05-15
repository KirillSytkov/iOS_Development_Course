//
//  ViewController.swift
//  PasswordReseter
//
//  Created by Kirill Sytkov on 13.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    let newPasswordTextFiled = PasswordTextField(placeHolder: "New password")
    let statusView = PasswordStatusView()
    let confirmPasswordtextField = PasswordTextField(placeHolder: "Re-enter new password")
    let resetButton = UIButton(type: .system)
    
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
        statusView.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordtextField.translatesAutoresizingMaskIntoConstraints = false
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.setAttributedTitle(NSAttributedString(string: "Reset password", attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title3)]), for: .normal)
        resetButton.backgroundColor = .systemBlue
        resetButton.tintColor = .white
        resetButton.layer.cornerRadius = 5
//        resetButton.addTarget(self, action: #selector(resetPasswordButtonPressed), for: .primaryActionTriggered)
        

    }
    
    private func layout() {
        stackView.addArrangedSubview(newPasswordTextFiled)
        stackView.addArrangedSubview(statusView)
        stackView.addArrangedSubview(confirmPasswordtextField)
        stackView.addArrangedSubview(resetButton)
        view.addSubview(stackView)
 
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            
            resetButton.heightAnchor.constraint(equalToConstant: 50)

        ])
    }
}
