//
//  PasswordCriteria.swift
//  PasswordReseter
//
//  Created by Kirill Sytkov on 16.05.2022.
//

import Foundation

struct PasswordCriteria {
    static func lenghtCriteriaMet(_ text: String) -> Bool {
        text.count >= 8 && text.count <= 32
    }
    static func noSpaceCriteriaMet(_ text: String) -> Bool {
        text.rangeOfCharacter(from: NSCharacterSet.whitespaces) == nil
    }
    static func lengthAndNoSpaceMet(_ text: String) -> Bool {
        lenghtCriteriaMet(text) && noSpaceCriteriaMet(text)
    }
    
    static func uppercaseMet(_ text: String) -> Bool {
        text.range(of: "[A-Z]+", options: .regularExpression) != nil
    }
    
    static func lowercaseMet(_ text:String) -> Bool {
        text.range(of: "[a-z]+", options: .regularExpression) != nil
    }
    
    static func digitMet(_ text: String) -> Bool {
        text.range(of: "[0-9]+", options: .regularExpression) != nil
    }
    
    static func specialCharacterMet(_ text: String) -> Bool {
        text.range(of: "[@:?!()$#,./\\\\]+", options: .regularExpression) != nil
    }
}