//
//  PasswordCriteriaTests.swift
//  PasswordReseterTests
//
//  Created by Kirill Sytkov on 05.06.2022.
//



import XCTest

@testable import PasswordReseter

class PasswordLengthCriteriaTests: XCTestCase {
    
    func testShort() throws {
        XCTAssertFalse(PasswordCriteria.lenghtCriteriaMet("1234567"))
    }
    
    func testLong() throws {
        XCTAssertFalse(PasswordCriteria.lenghtCriteriaMet("123456789012345678901234567890123"))
    }
    
    func testValidShort() throws {
        XCTAssertTrue(PasswordCriteria.lenghtCriteriaMet("12345678"))
        
    }
    
    func testValidLong() throws {
        XCTAssertTrue(PasswordCriteria.lenghtCriteriaMet("1234567890123456789012"))
    }
}

class PasswordOtherCriteriaTests: XCTestCase {
    
    func testSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.noSpaceCriteriaMet("abc"))
    }
    
    func testSpaceNotMet() throws {
        XCTAssertFalse(PasswordCriteria.noSpaceCriteriaMet("a bc"))
    }
    
    func testlengthAndSpaceMet() throws {
        XCTAssertFalse(PasswordCriteria.lengthAndNoSpaceMet("12 b"))
    }
    
    func testlengthAndNoSpaceMet() throws {
        XCTAssertTrue(PasswordCriteria.lengthAndNoSpaceMet("abcde4561"))
    }
    
    func testUppercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.uppercaseMet("A"))
    }
    
    func testNoUppercaseMEt() throws {
        XCTAssertFalse(PasswordCriteria.uppercaseMet("a"))
    }
    
    func testLowercaseMet() throws {
        XCTAssertTrue(PasswordCriteria.lowercaseMet("a"))
    }
    
    func testNoLowercaseMet() throws {
        XCTAssertFalse(PasswordCriteria.lowercaseMet("A"))
    }
    
    func testDigitMet() throws {
        XCTAssertTrue(PasswordCriteria.digitMet("1"))
    }
    
    func testNoDigitMet() throws {
        XCTAssertFalse(PasswordCriteria.digitMet("a"))
    }
    
    func testSpecialCharacterMet() throws {
        XCTAssertTrue(PasswordCriteria.specialCharacterMet(":"))
    }
    
    func testNoSpecialCharacterMet() throws {
        XCTAssertFalse(PasswordCriteria.specialCharacterMet(">"))
    }
}


