//
//  TableViewController2.swift
//  Demosplit
//
//  Created by Chien on 4/6/18.
//  Copyright © 2018 Chien. All rights reserved.
//

import UIKit

class TableViewController2: UITableViewController {
       
    var districts: [Districts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///get the path of the plist file
        if let path = Bundle.main.path(forResource: "Districts", ofType: "plist"){
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    guard let root = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as?  Dictionary<AnyHashable,Any> else {return}
                    if let districtsOject = root["Districts"] as? [Dictionary<AnyHashable,Any>] {
                        for district in districtsOject {
                            if let _district = Districts(dict: district){
                                districts.append(_district)
                            }
                        }
                    }
                } catch {
                    print("Error: PropertyListSerialization error")

                }
            }
        }
        
        for dis in districts {
            print(dis.citycode,dis.districtcode,dis.name)
        }
        
        
    }
}
