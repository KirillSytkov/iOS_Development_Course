//
//  ViewControllerTests.swift
//  PasswordReseterTests
//
//  Created by Kirill Sytkov on 05.06.2022.
//

import XCTest

@testable import PasswordReseter

class ViewControllerTests_NewPassword_Validation: XCTestCase {

    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "1234Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }

    func testEmptyPassword() throws {
        vc.newPasswordText = ""
        vc.resetPasswordButtonTapped(UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "Enter your password")
    }
    
    func testInvalidPassword() throws {
        vc.newPasswordText = "🕹"
        vc.resetPasswordButtonTapped(UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "Enter valid special chars (.,@:?!()$\\/#) with no spaces")
    }

    func testCriteriaNotMet() throws {
        vc.newPasswordText = tooShort
        vc.resetPasswordButtonTapped(UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "Your password must meet the requirements below")
    }

    func testValidPassword() throws {
        vc.newPasswordText = validPassword
        vc.resetPasswordButtonTapped(UIButton())
        
        XCTAssertEqual(vc.newPasswordTextField.errorMessageLabel.text!, "")
    }
}

class ViewControllerTests_Confirm_Password_Validation: XCTestCase {

    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "1234Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    func testEmptyPassword() throws {
        vc.confirmPasswordText = ""
        vc.resetPasswordButtonTapped(UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorMessageLabel.text!, "Enter your password")
    }
    
    func testPasswordsDoNotMatch() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = tooShort
        vc.resetPasswordButtonTapped(UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorMessageLabel.text!, "Password do not match")
    }

    func testPasswordsMatch() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = validPassword
        vc.resetPasswordButtonTapped(UIButton())
        
        XCTAssertEqual(vc.confirmPasswordTextField.errorMessageLabel.text!, "")
    }
}

class ViewControllerTests_Show_Alert: XCTestCase {

    var vc: ViewController!
    let validPassword = "12345678Aa!"
    let tooShort = "1234Aa!"
    
    override func setUp() {
        super.setUp()
        vc = ViewController()
    }
    
    func testShowSuccess() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = validPassword
        vc.resetPasswordButtonTapped(UIButton())

        XCTAssertNotNil(vc.alert)
        XCTAssertEqual(vc.alert!.title, "Success") // Optional
    }

    func testShowError() throws {
        vc.newPasswordText = validPassword
        vc.confirmPasswordText = tooShort
        vc.resetPasswordButtonTapped(UIButton())

        XCTAssertNil(vc.alert)
    }
}
