//
//  District.swift
//  Demosplit
//
//  Created by Chien on 4/6/18.
//  Copyright © 2018 Chien. All rights reserved.
//

import UIKit
class Districts {
    var citycode : Int
    var districtcode : Int
    var name : String
    init?(dict: Dictionary<AnyHashable,Any>) {
        guard let citycode = dict["CityCode"] as? Int else { return nil}
        guard let districtcode = dict["DistrictCode"] as? Int else {return nil}
        guard let name = dict["Name"] as? String else {return nil}
        self.citycode = citycode
        self.districtcode = districtcode
        self.name = name
    }
}
