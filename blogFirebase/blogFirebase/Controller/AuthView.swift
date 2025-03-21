//
//  ViewController.swift
//  blogFirebase
//
//  Created by ÖMER  on 19.03.2025.
//

import UIKit
import FirebaseAuth

class AuthView: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
    
    @IBAction func signInButton(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            if email != "" && password != "" {
                Auth.auth().signIn(withEmail: email, password: password) { authData, error in
                    if error != nil {
                        // Hata Var -> Firebase özgü hata mesajı dönecek
                        self.makeAlert(alertTitle: "Error!", alertMessage: error?.localizedDescription ?? "Error")
                    }else{
                        // Hata Yok -> BlogView geç
                        if let currentUser = Auth.auth().currentUser {
                            print("Signed in user: \(currentUser.email ?? "No email")")
                        }
                        self.performSegue(withIdentifier: "toBlog", sender: nil)
                        
                        
                    }
                }
            }else{
                self.makeAlert(alertTitle: "Error!", alertMessage: "Username/Password cannot be empty!")
            }
        }
    }
    

    @IBAction func signUpButton(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            if email != "" && password != "" {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if error != nil {
                        // Hata Var -> Firebase özgü hata mesajı dönecek
                        self.makeAlert(alertTitle: "Error!", alertMessage: error?.localizedDescription ?? "Error")
                    }else{
                        // Hata Yok -> BlogView geç
                        self.performSegue(withIdentifier: "toBlog", sender: nil)
                    }
                }
            }else{
                self.makeAlert(alertTitle: "Error!", alertMessage: "Username/Password cannot be empty!")
            }
            
        }
    }
    
    func makeAlert(alertTitle:String, alertMessage:String){
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
}

