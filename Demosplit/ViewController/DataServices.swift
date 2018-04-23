//
//  Dấtervices.swift
//  Demosplit
//
//  Created by Chien on 4/10/18.
//  Copyright © 2018 Chien. All rights reserved.
//

import UIKit
class DataServices {
    static let shared: DataServices = DataServices()
    ///---------------------------Cities-----------------------------///
    private var _cities : [City]?
    var cities: [City] {
        set {
            _cities = newValue
        }
        get {
            if _cities == nil{
                updateDataCiti()
            }
            return _cities ?? []
        }
    }
    func updateDataCiti() {
        _cities = []
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
                                _cities?.append(city)                            }
                        }
                    }
                } catch {
                    print("Error: PropertyListSerialization error")
                }
            }
            
        }
        
    }
    ///---------------------------District-----------------------------///
    private var _district : [Districts]?
    var district: [Districts] {
        set {
            _district = newValue
        }
        get {
            if _district == nil{
                updateDataDistrict()
            }
            return _district ?? []
        }
    }
    
    var cityCode: Int = 0
    
    func updateDataDistrict() {
        _district = []
        ///get the path of the plist file
        if let path = Bundle.main.path(forResource: "Districts", ofType: "plist"){
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    guard let root = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as?  Dictionary<AnyHashable,Any> else {return}
                    if let districtsOject = root["Districts"] as? [Dictionary<AnyHashable,Any>] {
                        for _districtOject in districtsOject {
                            if let dis = Districts(dict: _districtOject){
                                if dis.citycode == cityCode {
                                    _district?.append(dis)
                                }
                            }
                        }
                    }
                } catch {
                    print("Error: PropertyListSerialization error")
                    
                }
            }
        }
    }
    /// Xoá đi gía trị các Dítrict khi load lại city khác
    
    func removeData() {
        _district = nil
    }
    
}

