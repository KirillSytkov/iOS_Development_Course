//
//  AccountSumaryViewController.swift
//  Bankey
//
//  Created by Kirill Sytkov on 02.05.2022.
//

import UIKit

class AccountSummaryViewController: UIViewController {
    
    var accounts: [AccountSummaryCell.ViewModel] = []
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupTableHeaderView()
        fetchData()
    }
}

//MARK: - Extensions
extension AccountSummaryViewController {

    private func setupTableView() {
        tableView.backgroundColor = Constants.Colors.appColor
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
        tableView.rowHeight = AccountSummaryCell.rowHeight
        tableView.tableFooterView = UIView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    private func setupTableHeaderView() {
        let header = AccountSummaryHeaderView(frame: .zero)
        
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        tableView.tableHeaderView = header
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as? AccountSummaryCell, !accounts.isEmpty else { return UITableViewCell() }
        cell.configure(with: accounts[indexPath.row])
        return cell
    }
    
    
}

extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension AccountSummaryViewController { // faking out the network call and got the data
    private func fetchData() {
        let savings = AccountSummaryCell.ViewModel(accountType: .Banking, accountName: "Basic Savings", balance: 929466.23)
        let chequing = AccountSummaryCell.ViewModel(accountType: .Investment, accountName: "No-fee All-in Chequing", balance: 17562.44)
        let visa = AccountSummaryCell.ViewModel(accountType: .CreditiCard, accountName: "Visa Avion Card", balance: 412.83)
        let masterCard = AccountSummaryCell.ViewModel(accountType: .CreditiCard, accountName: "Student Mastercard", balance: 50.83)
        let investment = AccountSummaryCell.ViewModel(accountType: .Investment, accountName: "Tax-Free Saver", balance: 20000.00)
        let investment2 = AccountSummaryCell.ViewModel(accountType: .Investment, accountName: "Growth Fund", balance: 15000.00)
        
        accounts.append(savings)
        accounts.append(chequing)
        accounts.append(visa)
        accounts.append(masterCard)
        accounts.append(investment)
        accounts.append(investment2)
        
    }
}
