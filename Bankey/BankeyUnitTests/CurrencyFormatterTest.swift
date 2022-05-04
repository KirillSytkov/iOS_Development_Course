//
//  CurrencyFormatterTest.swift
//  BankeyUnitTests
//
//  Created by Kirill Sytkov on 04.05.2022.
//

import Foundation
import XCTest

@testable import Bankey

class Test: XCTestCase {
    
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()

    }
    
    func testShouldVisible() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.23)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "23")
    }
}
