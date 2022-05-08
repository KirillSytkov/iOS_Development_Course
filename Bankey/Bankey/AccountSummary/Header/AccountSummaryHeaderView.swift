//
//  AccountSummaryHeaderView.swift
//  Bankey
//
//  Created by Kirill Sytkov on 02.05.2022.
//

import UIKit

class AccountSummaryHeaderView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    let shakeBellView = ShakeyBellView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 144)
    }
    private func commonInit() {
        let bundle = Bundle(for: AccountSummaryHeaderView.self)
        
        bundle.loadNibNamed("AccountSummaryHeaderView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.backgroundColor = Constants.Colors.appColor
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        setupShakeyBell()
    }
    
    private func setupShakeyBell() {
        shakeBellView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(shakeBellView)
        
        NSLayoutConstraint.activate([
            shakeBellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shakeBellView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

