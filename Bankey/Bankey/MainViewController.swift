//
//  MainViewController.swift
//  Bankey
//
//  Created by Kirill Sytkov on 01.05.2022.
//
import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }
    
    private func setupViews() {
        let summaryVC = AccountSummaryViewController()
        let moneyVC = MoveMoneyViewController()
        let moreVC = MoreViewController()
        
        summaryVC.setTabBarInage(imageName: "list.dash.header.rectangle", title: "Summary")
        moneyVC.setTabBarInage(imageName: "arrow.left.arrow.right", title: "Move Money")
        moreVC.setTabBarInage(imageName: "ellipsis.circle", title: "More")
        
        let sumaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)
        
        sumaryNC.navigationBar.barTintColor = Constants.Colors.appColor
        hideNavigationBar(sumaryNC.navigationBar)
        let tabBarList = [sumaryNC, moneyNC, moreNC]
        
        viewControllers = tabBarList
    }
    private func hideNavigationBar(_ navigationBar: UINavigationBar) {
        let img = UIImage()
        navigationBar.shadowImage = img
        navigationBar.setBackgroundImage(img, for: .default)
        navigationBar.isTranslucent = false
    }
    
    private func setupTabBar() {
        tabBar.tintColor = Constants.Colors.appColor
        tabBar.isTranslucent = false
    }
}
class AccountSummaryViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
}
class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
    }
}
class MoreViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
    }
}
