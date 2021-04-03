//
//  CurrentUserAuth.swift
//  TestTask_Weelorum
//
//  Created by Zufar Suleimanov on 02.04.2021.
//

import Foundation
import FirebaseAuth

class CurrentUserAuth {
    
    func getStartScreen() -> UIViewController {
        
        guard Auth.auth().currentUser?.uid != nil, Auth.auth().currentUser?.email != nil else {
            
            let storyboard =  UIStoryboard(name: Storyboards.authorization.rawValue, bundle: nil)
            let screen = storyboard.instantiateViewController(withIdentifier: ViewControllers.authorization.rawValue)
            
            return screen
        }
        
        let storyboard =  UIStoryboard(name: Storyboards.mainTabBar.rawValue, bundle: nil)
        let screen = storyboard.instantiateViewController(withIdentifier: ViewControllers.mainTabBar.rawValue)
        
        return screen
    }

}

