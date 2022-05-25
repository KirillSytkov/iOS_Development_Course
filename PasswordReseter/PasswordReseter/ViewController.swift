//
//  ViewController.swift
//  PasswordReseter
//
//  Created by Kirill Sytkov on 13.05.2022.
//

import UIKit

class ViewController: UIViewController {
    typealias CustomValidation = PasswordTextField.CustomValidation
    
    let stackView = UIStackView()
    let newPasswordTextFiled = PasswordTextField(placeHolder: "New password")
    let statusView = PasswordStatusView()
    let confirmPasswordTextField = PasswordTextField(placeHolder: "Re-enter new password")
    let resetButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        setup()
    }
    
}

extension ViewController {
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        newPasswordTextFiled.translatesAutoresizingMaskIntoConstraints = false
        
        statusView.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.setAttributedTitle(NSAttributedString(string: "Reset password", attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title3)]), for: .normal)
        resetButton.backgroundColor = .systemBlue
        resetButton.tintColor = .white
        resetButton.layer.cornerRadius = 5
        resetButton.addTarget(self, action: #selector(resetPasswordButtonTapped), for: .primaryActionTriggered)
    }
    
    private func layout() {
        stackView.addArrangedSubview(newPasswordTextFiled)
        stackView.addArrangedSubview(statusView)
        stackView.addArrangedSubview(confirmPasswordTextField)
        stackView.addArrangedSubview(resetButton)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            
            resetButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    private func setup() {
        setupNewPassword()
        setupConfirmPassword()
        setupDismissKeyboardGesture()
        setupKeyboardHiding()
    }
    
    private func setupKeyboardHiding() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setupNewPassword() {
        let newPasswordValidation: CustomValidation = { text in
            guard let text = text, !text.isEmpty else {
                self.statusView.reset()
                return (false, "Enter yuor password")
            }
            
            //Valid characters
            let validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,@:?!()$\\/#"
            let invalidSet = CharacterSet(charactersIn: validChars).inverted
            guard text.rangeOfCharacter(from: invalidSet) == nil else {
                self.statusView.reset()
                return (false, "Enter valid special chars (.,@:?!()$\\/#) with no spaces")
            }
            
            //Criteria met
            self.statusView.upadateDisplay(text)
            if !self.statusView.validate(text) {
                return (false,"Your password must meet the requirements below")
            }
            
            return (true,"")
        }
        newPasswordTextFiled.customValidation = newPasswordValidation
        newPasswordTextFiled.delegate = self
    }
    
    private func setupConfirmPassword() {
        let confirmPasswordValidation: CustomValidation = { text in
            guard let text = text, !text.isEmpty else {
                return (false, "Enter your password.")
            }
            guard text == self.newPasswordTextFiled.text else {
                return (false, "Password do not match.")
            }
            
            return (true, "")
        }
        
        confirmPasswordTextField.customValidation = confirmPasswordValidation
        confirmPasswordTextField.delegate = self
    }
    
    private func setupDismissKeyboardGesture() {
        let dismissKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        view.addGestureRecognizer(dismissKeyboardTap)
    }
    
    @objc func viewTapped(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
}

extension ViewController: PasswordTextFieldDelegate {
    func editingChanged(_ sender: PasswordTextField) {
        if sender == newPasswordTextFiled {
            statusView.upadateDisplay(sender.textFiled.text ?? "")
        }
    }
    
    func editingDidEnd(_ sender: PasswordTextField) {
        if sender === newPasswordTextFiled {
            statusView.shouldResetCriteria = false
            _ = newPasswordTextFiled.validate()
        } else if sender == confirmPasswordTextField {
            _ = confirmPasswordTextField.validate()
        }
    }
    
}

extension ViewController {
    @IBAction func keyboardWillShow(sender: NSNotification) {
        
        guard let userInfo = sender.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let currentTextField = UIResponder.currentFirst() as? UITextField else { return }
        
        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
        let convertedTextFieldFrame = view.convert(currentTextField.frame, from: currentTextField.superview)
        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
        
        
        if textFieldBottomY > keyboardTopY {
            let textBoxY = convertedTextFieldFrame.origin.y
            let newFrameY = (textBoxY - keyboardTopY / 2) * -1
            view.frame.origin.y = newFrameY
        }
    }
    
    @IBAction func keyboardWillHide(sender: NSNotification) {
        view.frame.origin.y = 0
    }
}
//MARK: - Action
extension ViewController {
    @IBAction func resetPasswordButtonTapped(_ sender: UIButton) {
        view.endEditing(true)
        
        let isValidNewPassword = newPasswordTextFiled.validate()
        let isValidConfirmPassword = confirmPasswordTextField.validate()
        
        if isValidNewPassword && isValidConfirmPassword {
            showAlert(title: "Success", message: "You have successfully changed your password.")
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert =  UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        alert.title = title
        alert.message = message
        present(alert, animated: true, completion: nil)
    }
}
