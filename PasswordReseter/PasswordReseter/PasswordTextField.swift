//
//  PasswordTextField.swift
//  PasswordReseter
//
//  Created by Kirill Sytkov on 14.05.2022.
//

import Foundation
import UIKit

protocol PasswordTextFieldDelegate: AnyObject {
    func editingChanged(_ sender: PasswordTextField)
}

class PasswordTextField: UIView {
    
    let lockImageView = UIImageView(image: UIImage(systemName: "lock.fill"))
    let textFiled = UITextField()
    let placeholderText: String
    let eyeButton = UIButton(type: .custom)
    let dividerView = UIView()
    let errorMessageLabel = UILabel()
    
    weak var delegate: PasswordTextFieldDelegate?
    
    init(placeHolder: String) {
        self.placeholderText = placeHolder
        super.init(frame: .zero)
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 60)
    }
}

extension PasswordTextField {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        lockImageView.translatesAutoresizingMaskIntoConstraints = false
        
        textFiled.translatesAutoresizingMaskIntoConstraints = false
        textFiled.isSecureTextEntry = true
        textFiled.delegate = self
        textFiled.keyboardType = .asciiCapable
        textFiled.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel])
        textFiled.addTarget(self, action: #selector(textFieldEditingChange), for: .editingChanged)
        
        eyeButton.translatesAutoresizingMaskIntoConstraints = false
        eyeButton.setImage(UIImage(systemName: "eye.circle"), for: .normal)
        eyeButton.setImage(UIImage(systemName: "eye.slash.circle"), for: .selected)
        eyeButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .separator
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.font = .preferredFont(forTextStyle: .footnote)
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.lineBreakMode = .byWordWrapping
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.text = "Your password must meet the requirements below"
        errorMessageLabel.isHidden = true
        
    }
    
    func layout() {
        addSubview(lockImageView)
        addSubview(textFiled)
        addSubview(eyeButton)
        addSubview(dividerView)
        addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            lockImageView.topAnchor.constraint(equalTo: topAnchor),
            lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            textFiled.topAnchor.constraint(equalTo: topAnchor),
            textFiled.leadingAnchor.constraint(equalToSystemSpacingAfter: lockImageView.trailingAnchor, multiplier: 1),
            
            eyeButton.topAnchor.constraint(equalTo: topAnchor),
            eyeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: textFiled.trailingAnchor, multiplier: 1),
            eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            dividerView.topAnchor.constraint(equalToSystemSpacingBelow: textFiled.bottomAnchor, multiplier: 1),
            dividerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 1),
            
            errorMessageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: dividerView.bottomAnchor, multiplier: 0.5),
            errorMessageLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
        ])
        
        //CHCR
        lockImageView.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
        textFiled.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        eyeButton.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: .horizontal)
    }
}
//MARK: - Actions
extension PasswordTextField {
    @IBAction func togglePasswordView(_ sender: UIButton) {
        textFiled.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
    
    @IBAction func textFieldEditingChange(_ sender: UITextField) {
        delegate?.editingChanged(self)
    }
    
}

extension PasswordTextField: UITextFieldDelegate {
   
}


