//
//  BlogView.swift
//  blogFirebase
//
//  Created by ÖMER  on 19.03.2025.
//

import UIKit

class BlogView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toAuth", sender: nil)
    }
    
    
}
