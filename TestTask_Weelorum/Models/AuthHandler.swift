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
    
    static func loginUser(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            if error == nil {
                UserDefaults.standard.set(authResult?.user.email, forKey: "authEmail")
            } else {
                createUser(email: email, password: password)
            }
        }
    }
    
    static func createUser(email: String, password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if error == nil {
                UserDefaults.standard.set(authResult?.user.email, forKey: "authEmail")
            }
        }
    }
    
}
