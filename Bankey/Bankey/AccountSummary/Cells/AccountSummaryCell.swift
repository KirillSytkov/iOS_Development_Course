//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by Kirill Sytkov on 03.05.2022.
//

import Foundation
import UIKit

class AccountSummaryCell: UITableViewCell {
    
    let typeLable = UILabel()
    let underLineView = UIView()
    let nameLabel = UILabel()
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    
    let chevronImageView = UIImageView()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 100
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension AccountSummaryCell {
    private func setup() {
        typeLable.translatesAutoresizingMaskIntoConstraints = false
        typeLable.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLable.adjustsFontForContentSizeCategory = true
        typeLable.text = "Account type"
        
        underLineView.translatesAutoresizingMaskIntoConstraints = false
        underLineView.backgroundColor = Constants.Colors.appColor
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.text = "Account name"
        
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.textAlignment = .right
        balanceLabel.text = "Some balance"
        
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.textAlignment = .right
        balanceAmountLabel.text = "$929,466.63"
        
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        let chevronImage = UIImage(systemName: "chevron.right")?.withTintColor(Constants.Colors.appColor, renderingMode: .alwaysOriginal)
        chevronImageView.image = chevronImage
        
        contentView.addSubview(typeLable)
        contentView.addSubview(underLineView)
        contentView.addSubview(nameLabel)

        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        
        contentView.addSubview(balanceStackView)
        contentView.addSubview(chevronImageView)
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            typeLable.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLable.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2)
        ])
        NSLayoutConstraint.activate([
            underLineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLable.bottomAnchor, multiplier: 1),
            underLineView.leadingAnchor.constraint(equalTo: typeLable.leadingAnchor),
            underLineView.widthAnchor.constraint(equalToConstant: 60),
            underLineView.heightAnchor.constraint(equalToConstant: 4)
        ])
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underLineView.bottomAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalTo: typeLable.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: underLineView.bottomAnchor, multiplier: 0),
            balanceStackView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 5)
        ])
        NSLayoutConstraint.activate([
            chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: underLineView.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 2)
        ])
        
       
    
    }
}
