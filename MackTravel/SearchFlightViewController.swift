//
//  SearchFlightViewController.swift
//  MackTravel
//
//  Created by Edison Cury on 3/2/18.
//  Copyright © 2018 Edison Cury. All rights reserved.
//

import UIKit

class SearchFlightViewController: UIViewController {

    // Variables
    @IBOutlet weak var searchFlightView: UIView!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var originInput: UITextField!
    @IBOutlet weak var destinationInput: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var logoutBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchFlightView.layer.cornerRadius = 4.0
        self.searchFlightView.layer.borderWidth = 2.0
        self.searchFlightView.layer.borderColor = UIColor.white.cgColor
        self.searchBtn.layer.cornerRadius = 2.0
        self.logoutBtn.layer.borderWidth = 1.0
        self.logoutBtn.layer.cornerRadius = 3.0
        self.logoutBtn.layer.borderColor = UIColor.white.cgColor
        self.logoutBtn.clipsToBounds = true
        
    }

    @IBAction func searchFlight(_ sender: Any) {
        print(originInput.text)
        print(destinationInput.text)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateStr = dateFormatter.string(from: datePicker.date)
        print(dateStr)
        
        
    }
    
    @IBAction func logout(_ sender: Any) {
        self.performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    
    

}
