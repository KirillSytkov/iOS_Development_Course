//
//  Decimal+extension.swift
//  Bankey
//
//  Created by Kirill Sytkov on 03.05.2022.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
