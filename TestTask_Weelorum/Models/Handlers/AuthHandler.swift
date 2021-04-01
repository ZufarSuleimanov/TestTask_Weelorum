//
//  AuthHandler.swift
//  TestTask_Weelorum
//
//  Created by Zufar Suleimanov on 01.04.2021.
//

import UIKit
import Foundation
import FirebaseAuth

class AuthHandler {
    
    static var checkAuth = Bool()
    
    static func loginUser(email: String, password: String) -> Bool {
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error == nil {
                checkAuth = true
            } else {
                checkAuth = createUser(email: email, password: password)
            }
        }
        
        return checkAuth
    }
    
    static func createUser(email: String, password: String) -> Bool {
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if error == nil {
                checkAuth = true
            } else {
                checkAuth = false
            }
        }
        
        return checkAuth
    }
    
}
