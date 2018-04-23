//
//  model.swift
//  Demosplit
//
//  Created by Chien on 4/5/18.
//  Copyright © 2018 Chien. All rights reserved.
//

import UIKit

class City {
    var code: Int
    var name: String
    init?(dict: Dictionary<AnyHashable,Any>) {
        guard let code = dict["CityCode"] as? Int else { return nil }
        guard let name = dict["Name"] as? String else { return nil }
        self.code = code
        self.name = name
    }
}
