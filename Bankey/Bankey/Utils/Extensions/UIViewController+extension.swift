//
//  UIViewController+extension.swift
//  Bankey
//
//  Created by Kirill Sytkov on 30.04.2022.
//

import UIKit

extension UIViewController {
    func setStatusBar () {
        let statusBarSize = UIApplication.shared.statusBarFrame.size
        let frame = CGRect(origin: .zero, size: statusBarSize)
        let statusBarView = UIView(frame: frame)
        
        statusBarView.backgroundColor = Constants.Colors.appColor
        view.addSubview(statusBarView)
    }
    
    func setTabBarInage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
