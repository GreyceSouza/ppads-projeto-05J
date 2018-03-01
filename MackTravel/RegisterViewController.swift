//
//  RegisterViewController.swift
//  MackTravel
//
//  Created by Edison Cury on 3/1/18.
//  Copyright © 2018 Edison Cury. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    // Variables
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var sendRegisterBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerView.layer.cornerRadius = 4.0
        self.registerView.layer.borderWidth = 1.0
        self.registerView.layer.borderColor = UIColor.white.cgColor
        
        self.sendRegisterBtn.layer.cornerRadius = 4.0
        self.sendRegisterBtn.clipsToBounds = true
        
    }

    @IBAction func backToLogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

    

}
