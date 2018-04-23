//
//  TableViewController.swift
//  Demosplit
//
//  Created by Chien on 4/5/18.
//  Copyright © 2018 Chien. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var cities: [City] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //get the path of the plist file
        /// 1 - Truy cap vao duong dan cua file
        if let path = Bundle.main.path(forResource: "Cities", ofType: "plist") {
            /// 2- Doc cac du lieu trong file
            if let data = FileManager.default.contents(atPath: path) {
                ///  3- Xu ly du lieu
                do {
                    guard let root = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? Dictionary<AnyHashable, Any> else { return }
                    /// Khoi tao mot mang citiesOject chua toan bo du lieu cua Cities
                    if let citiesObject = root["Cities"] as? [Dictionary<AnyHashable,Any>] {
                        for cityObject in citiesObject {
                            /// Xet xem neu nhu thang city dung la 1 city co kieu la Class " City" trong cityOject thi appen no vap mang Cities da khoi tao o tren 
                            if let city = City(dict: cityObject) {
                                cities.append(city)
                            }
                        }
                    }
                } catch {
                    print("Error: PropertyListSerialization error")
                }
            }
            
        }
        
        for city in cities {
            print(city.code, city.name)
        }
    }
}
