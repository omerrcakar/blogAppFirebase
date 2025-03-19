//
//  ViewController.swift
//  blogFirebase
//
//  Created by ÖMER  on 19.03.2025.
//

import UIKit

class AuthView: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signInButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toBlog", sender: nil)
    }
    

    @IBAction func signUpButton(_ sender: UIButton) {
        
        
    }
    
}

