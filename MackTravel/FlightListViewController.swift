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
    
    
    
    

}
