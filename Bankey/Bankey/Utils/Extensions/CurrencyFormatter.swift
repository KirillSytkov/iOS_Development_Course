//
//  CurrencyFormatter.swift
//  Bankey
//
//  Created by Kirill Sytkov on 03.05.2022.
//

import Foundation
import UIKit

struct CurrencyFormatter {
    
    func makeAttributedCurrency(_ amount: Decimal) -> NSMutableAttributedString {
        let tuple = breakIntoDollarsAndCents(amount)
        return makeBalanceAttributed(dollars: tuple.0, cents: tuple.1)
    }
    
    func breakIntoDollarsAndCents(_ amount: Decimal) -> (String, String) {
        let tuple = modf(amount.doubleValue)
        
        let dollars = convertDollars(tuple.0)
        let cents = convertCents(tuple.1)
        return (dollars,cents)
    }
    
    private func convertDollars(_ dollarPart: Double) -> String {
        let dollarWithDecimal = dollarsFormatted(dollarPart)
        
        let formatter = NumberFormatter()
        
        let decimalseparator = formatter.decimalSeparator!
        
        let dollarComponents = dollarWithDecimal.components(separatedBy: decimalseparator)
        let dollars = dollarComponents.first!
//        dollars.removeFirst()
        
        return dollars
    }
    
    private func convertCents(_ centPart: Double) -> String {
        let cents: String
        
        if centPart == 0 {
            cents = "00"
        } else {
            cents = String(format: "%.0f", centPart * 100)
        }
        return cents
    }
    
     private func dollarsFormatted(_ dollars: Double) -> String {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        formatter.usesGroupingSeparator = true
        
        if let result = formatter.string(from: dollars as NSNumber) {
            return result
        }
        return ""
    }
    
    
    private func makeBalanceAttributed(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSighAttributes: [NSMutableAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        let dollarAttribures: [NSMutableAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSMutableAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 8]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSighAttributes)
        let dollarString = NSMutableAttributedString(string: dollars, attributes: dollarAttribures)
        let centsString = NSMutableAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centsString)
        
        return rootString
    }
}
