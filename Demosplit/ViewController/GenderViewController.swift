//
//  AgeViewController.swift
//  Demosplit
//
//  Created by Chien on 4/13/18.
//  Copyright © 2018 Chien. All rights reserved.
//

import UIKit

class GenderViewController: UIViewController,UIPickerViewDelegate {

    @IBOutlet var btn: [UIButton]!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func checkBoxTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        btn.forEach { bt in
            if bt != sender {
                bt.isSelected = false
            }
        }
        switch sender.tag {
        case 1:
            UserDefaults.standard.set("Man", forKey: "Sex")
        case 2:
            UserDefaults.standard.set("Woman", forKey: "Sex")
        default:
            UserDefaults.standard.set("Gay", forKey: "Sex")
        }
    }
    
}
