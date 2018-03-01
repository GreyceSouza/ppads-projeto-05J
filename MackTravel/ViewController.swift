//
//  ViewController.swift
//  MackTravel
//
//  Created by Edison Cury on 2/28/18.
//  Copyright © 2018 Edison Cury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Variables
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView.layer.borderWidth = 1.0
        self.loginView.layer.borderColor = UIColor.white.cgColor
        self.loginView.layer.cornerRadius = 4.0
        self.loginView.clipsToBounds = true
        
        self.loginBtn.layer.cornerRadius = 4.0
        self.loginBtn.clipsToBounds = true
        
        self.registerBtn.layer.cornerRadius = 4.0
        self.registerBtn.clipsToBounds = true
    }
    
    
    @IBAction func login(_ sender: Any) {
    }
    
    @IBAction func register(_ sender: Any) {
        self.performSegue(withIdentifier: "registerSegue", sender: nil)
    }
    
    

    
}

