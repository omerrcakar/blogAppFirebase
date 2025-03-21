//
//  BlogView.swift
//  blogFirebase
//
//  Created by ÖMER  on 19.03.2025.
//

import UIKit
import FirebaseAuth

class BlogView: UIViewController {
    
    //let currentUser = Auth.auth().currentUser

    override func viewDidLoad() {
        super.viewDidLoad()

        if let currentUser = Auth.auth().currentUser {
            let uid = currentUser.uid
            let email = currentUser.email

            print("UID: \(uid)")
            print("Email: \(email ?? "N/A")") // N/A -> No Answer
        } else {
            print("No user is signed in.")
        }
    }
    
    @IBAction func logOutButton(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
            print("Sign Out Successfully")
            self.performSegue(withIdentifier: "toAuth", sender: nil)
        }catch{
            print("Error signing out: \(error)")
        }
        
        
        
    }
    
    
}
