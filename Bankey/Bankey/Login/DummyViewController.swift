//
//  DummyViewController.swift
//  Bankey
//
//  Created by Kirill Sytkov on 29.04.2022.
//

import Foundation
import UIKit

class DummyViewController: UIViewController {
    let stackView = UIStackView()
    let label = UILabel()
    let closeButton = UIButton(type: .system)
    weak var logoutDelegate: LogoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
extension DummyViewController {
    func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.configuration = .filled()
        closeButton.setTitle("Logout", for: .normal)
        closeButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)
    }
    
    func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(closeButton)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
extension DummyViewController {
    @IBAction func logoutButtonTapped(sender: UIButton) {
        logoutDelegate?.didLogout()
    }
    
}
