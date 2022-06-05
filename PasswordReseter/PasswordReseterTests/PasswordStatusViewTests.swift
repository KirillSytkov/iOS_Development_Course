//
//  PasswordStatusViewTests.swift
//  PasswordReseterTests
//
//  Created by Kirill Sytkov on 05.06.2022.
//


import XCTest

@testable import PasswordReseter

class PasswordStatusViewTests_ShowCheckmarkOrReset_When_Validation_Is_inline: XCTestCase {
    
    var statusView: PasswordStatusView!
    let validPassword = "12345678Aa!"
    let tooShort = "123Aa!"
    
    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = true // inline
    }
    
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage) // ✅
    }
    
    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isResetImage) // ⚪️
    }
}

class PasswordStatusViewTests_ShowCheckmarkOrRedX_When_Validation_Is_Loss_Of_Focus: XCTestCase {

    var statusView: PasswordStatusView!
    let validPassword = "12345678Aa!"
    let tooShort = "123Aa!"

    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
        statusView.shouldResetCriteria = false // loss of focus
    }
    
    func testValidPassword() throws {
        statusView.updateDisplay(validPassword)
        XCTAssertTrue(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isCheckMarkImage) // ✅
    }

    func testTooShort() throws {
        statusView.updateDisplay(tooShort)
        XCTAssertFalse(statusView.lengthCriteriaView.isCriteriaMet)
        XCTAssertTrue(statusView.lengthCriteriaView.isXmarkImage) // ❌
    }
}

class PasswordStatusViewTests_Validate_Three_of_Four: XCTestCase {

    var statusView: PasswordStatusView!
    let twoOfFour = "12345678A"
    let threeOfFour = "12345678Aa"
    let fourOfFour = "12345678Aa!"

    override func setUp() {
        super.setUp()
        statusView = PasswordStatusView()
    }

    func testTwoOfFour() throws {
        XCTAssertFalse(statusView.validate(twoOfFour))
    }
    
    func testThreeOfFour() throws {
        XCTAssertTrue(statusView.validate(threeOfFour))
    }

    func testFourOfFour() throws {
        XCTAssertTrue(statusView.validate(fourOfFour))
    }
}
