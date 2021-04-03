//
//  AuthHandler.swift
//  TestTask_Weelorum
//
//  Created by Zufar Suleimanov on 01.04.2021.
//

import UIKit
import FirebaseAuth

class AuthHandler {
    
    static func loginUser(email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
            DispatchQueue.global(qos: .utility).async {
                if authResult?.user != nil {
                    UserDefaults.standard.set(authResult?.user.email, forKey: "authUser")
                }
            }
        }
    }
    
    static func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            DispatchQueue.global(qos: .utility).async {
                if authResult?.user != nil {
                    UserDefaults.standard.set(authResult?.user.email, forKey: "createUser")
                }
            }
        }
    }
    
}
