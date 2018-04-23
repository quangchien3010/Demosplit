//
//  FinishViewController.swift
//  Demosplit
//
//  Created by Chien on 4/14/18.
//  Copyright © 2018 Chien. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {

   
    
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtDistrict: UITextField!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       txtGender.text = UserDefaults.standard.string(forKey: "Sex")
        txtCity.text = UserDefaults.standard.string(forKey: "City")
        txtDistrict.text = UserDefaults.standard.string(forKey: "District")
        txtAge.text = String(UserDefaults.standard.integer(forKey: "Age"))
        // Do any additional setup after loading the view.
    }

    
   
}
