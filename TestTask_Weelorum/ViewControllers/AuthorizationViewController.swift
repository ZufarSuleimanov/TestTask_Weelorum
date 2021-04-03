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
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var processActivityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeInterface()
        UserDefaults().removeObject(forKey: "authUser")
        UserDefaults().removeObject(forKey: "createUser")
    }
    
    private func customizeInterface() {
        emailTextField.layer.cornerRadius = 15
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = #colorLiteral(red: 0.9000416994, green: 0.659925282, blue: 0.1484854519, alpha: 1)
        passwordTextField.layer.cornerRadius = 15
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = #colorLiteral(red: 0.9000416994, green: 0.659925282, blue: 0.1484854519, alpha: 1)
        signInButton.layer.cornerRadius = 15
        signUpButton.layer.cornerRadius = 15
        processActivityIndicatorView.isHidden = true
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        guard InputValidation() else {
            triggerNotification(title: "Ошибка", message: "Введены неверные данные")
            return
        }
        processActivityIndicatorView.isHidden = false
        processActivityIndicatorView.startAnimating()
        AuthHandler.loginUser(email: emailTextField.text!, password: passwordTextField.text!)
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
            self.processActivityIndicatorView.stopAnimating()
            self.processActivityIndicatorView.isHidden = true
            let createUser = UserDefaults.standard.string(forKey: "createUser")
            if createUser != nil {
                let storyboard = UIStoryboard(name: Storyboards.mainTabBar.rawValue, bundle: nil)
                let mainTabBar = storyboard.instantiateViewController(withIdentifier: ViewControllers.mainTabBar.rawValue)
                mainTabBar.modalPresentationStyle = .fullScreen
                self.present(mainTabBar, animated: true)
            } else {
                self.triggerNotification(title: "Ошибка", message: "Повторите вход или зарегистрируйтесь")
            }
        }
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        guard InputValidation() else {
            triggerNotification(title: "Ошибка", message: "Введены неверные данные")
            return
        }
        processActivityIndicatorView.isHidden = false
        processActivityIndicatorView.startAnimating()
        AuthHandler.createUser(email: self.emailTextField.text!, password: self.passwordTextField.text!)
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
            self.processActivityIndicatorView.stopAnimating()
            self.processActivityIndicatorView.isHidden = true
            let createUser = UserDefaults.standard.string(forKey: "createUser")
            if createUser != nil {
                self.triggerNotification(title: "Поздравляем", message: "Вы прошли регистрацию, нажмите кнопку Войти")
            } else {
                self.triggerNotification(title: "Ошибка", message: "Повторите регистрацию")
            }
        }
        
    }
    
    private func InputValidation() -> Bool {
        guard  emailTextField.text != "", passwordTextField.text != "" else { return false }
        return true
    }
    
    private func triggerNotification(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Закрыть", style: .default)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
}

