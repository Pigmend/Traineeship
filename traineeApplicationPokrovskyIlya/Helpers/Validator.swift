//
//  Validator.swift
//  traineeApplicationPokrovskyIlya
//
//  Created by Ilya Pokrovsky on 02.12.2019.
//  Copyright © 2019 Ilya Pokrovsky. All rights reserved.
//

import Foundation

class Validator {
    
    static func isValidEmailAdress(_ email: String?) -> String? {
        
        if email?.isEmpty ?? true {
            return "Please enter email!"
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        if !emailPred.evaluate(with: email) {
            return "Incorrect email!"
        }
        
        return nil
    }
    
    static func validatePassword(_ password: String?, _ confirm: String?) -> String? {
        
        let validPasswordError = self.validatePassword(password)
        if validPasswordError != nil {
            return validPasswordError
        }
        
        let validConfirmError = self.validatePassword(confirm)
        if validConfirmError != nil {
            return validConfirmError
        }
        
        if password != confirm {
            return "Incorrect confirm password!"
        }
        
        return nil
    }
    
    static func validatePassword(_ password: String?) -> String? {
        
        if password?.isEmpty ?? true {
            return "Password is empty!"
        }
        
        if (password?.count ?? 0) < 8 {
            return "Password must be longer then 8 latters"
        }
        
        if password?.trimmingCharacters(in: .whitespaces).isEmpty ?? true {
            return "Password cannot have whitespaces!"
        }
        
        return nil
    }
}
