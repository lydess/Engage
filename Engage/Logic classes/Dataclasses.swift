//
//  dataclasses.swift
//  Engage
//
//  Created by william Vise on 11/5/21.
//

import Foundation
import UIKit

class courseinfo {
    var db = DB()
   
    

    var name = String()
    var address = String()
    var courselist = [String]()
    var services = [String]()
    
    func setup() {
        var ns = db.listcampus()
        print(ns.value(forKey: "name"))
    }
}
