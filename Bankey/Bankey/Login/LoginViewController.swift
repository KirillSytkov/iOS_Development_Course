//
//  ViewController.swift
//  Bankey
//
//  Created by Kirill Sytkov on 26.04.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    let appTitle = UILabel()
    let appSubtitle = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
}
extension LoginViewController {
    
    private func style() {
        appTitle.translatesAutoresizingMaskIntoConstraints = false
        appTitle.text = "Bankey"
        appTitle.font = UIFont.systemFont(ofSize: 40)
        appTitle.textAlignment = .center
        
        appSubtitle.translatesAutoresizingMaskIntoConstraints = false
        appSubtitle.text = "Your premium source for all things banking!"
        appSubtitle.numberOfLines = 0
        appSubtitle.font = UIFont.systemFont(ofSize: 24)
        appSubtitle.textAlignment = .center
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator spacing
        signInButton.setTitle("Sign in", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        
    }
    
    private func layout() {
        view.addSubview(appTitle)
        view.addSubview(appSubtitle)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        //appTitle
        NSLayoutConstraint.activate([
            appSubtitle.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -30),
            appSubtitle.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: -10),
            appSubtitle.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -10),
            appTitle.bottomAnchor.constraint(equalTo: appSubtitle.topAnchor, constant: -20),
            appTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 3)
        ])
        
        // Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        // ErrorLabel
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    @IBAction func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username,
              let password = password else {
                  assertionFailure("Username / password should never be nil")
                  return
              }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Kirill" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
        
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}


