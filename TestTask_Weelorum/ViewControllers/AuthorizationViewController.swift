//
//  AuthorizationViewController.swift
//  TestTask_Weelorum
//
//  Created by Zufar Suleimanov on 31.03.2021.
//

import UIKit

class AuthorizationViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeInterface()
    }

    func customizeInterface() {
        emailTextField.layer.cornerRadius = 15
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = #colorLiteral(red: 0.9000416994, green: 0.659925282, blue: 0.1484854519, alpha: 1)
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = #colorLiteral(red: 0.9000416994, green: 0.659925282, blue: 0.1484854519, alpha: 1)
        startButton.layer.cornerRadius = 15
    }
    
    @IBAction func start(_ sender: UIButton) {
//        let checkAuth = AuthHandler.createUser(email: emailTextField.text!, password: passwordTextField.text!)
//        guard checkAuth else { return }
        let storyboard = UIStoryboard(name: Storyboards.mainTabBar.rawValue, bundle: nil)
        let testAuthView = storyboard.instantiateViewController(withIdentifier: ViewControllers.mainTabBar.rawValue)
        testAuthView.modalPresentationStyle = .fullScreen
        present(testAuthView, animated: true)
    }
    
}

