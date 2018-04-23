//
//  TableViewControllerDistrict.swift
//  Demosplit
//
//  Created by Chien on 4/10/18.
//  Copyright © 2018 Chien. All rights reserved.
//

import UIKit

class TableViewControllerDistrict: UITableViewController {
    
    var districts: [Districts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        districts = DataServices.shared.district
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return districts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "district", for: indexPath)
        cell.textLabel?.text = districts[indexPath.row].name
        
        // Configure the cell...
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaults.standard.set(districts[indexPath.row].name, forKey: "District")
        print(districts[indexPath.row].name)
    }
    
    
    
    
}
