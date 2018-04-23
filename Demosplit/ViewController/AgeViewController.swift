//
//  AgeViewController.swift
//  Demosplit
//
//  Created by Chien on 4/13/18.
//  Copyright © 2018 Chien. All rights reserved.
//

import UIKit

class AgeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var btn: UIButton!
    
    let age = [Int](1...100)
    override func viewDidLoad() {
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(17, inComponent: 0, animated: true)
        
        ///Bo vien cho Button
        btn.layer.cornerRadius = 25
        //UserDefaults.standard.set(age[row], forKey: "Age")
        super.viewDidLoad()
        
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return age.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(describing: age[row])
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(age[row], forKey: "Age")
    }
    
}
