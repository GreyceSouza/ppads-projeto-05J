//
//  FlightListViewController.swift
//  MackTravel
//
//  Created by Edison Cury on 3/1/18.
//  Copyright © 2018 Edison Cury. All rights reserved.
//

import UIKit

class FlightCell : UITableViewCell{
    
}

class FlightListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Variables
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var logoutBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.logoutBtn.layer.borderWidth = 1.0
        self.logoutBtn.layer.cornerRadius = 3.0
        self.logoutBtn.layer.borderColor = UIColor.white.cgColor
        self.logoutBtn.clipsToBounds = true
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "flightCell", for: indexPath) as! FlightCell
        
        
        return cell
    }
    
    @IBAction func logout(_ sender: Any) {
        self.performSegue(withIdentifier: "logoutSegue", sender: nil)
    }
    
    
    

}
