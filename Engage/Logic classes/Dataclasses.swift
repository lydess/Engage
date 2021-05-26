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

class campus {
    var Name: String
    var Address: String
    
    init(name: String, address: String) {
        Name = name
        Address = address
    }
    
}

class cells {
    var celllist = [UICollectionViewCell]()
    func buildcells() {
        let titlecell = UICollectionViewCell(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let bodycell = UICollectionViewCell(frame: CGRect(x: 0, y: 0, width: 100, height: 300))
        
        celllist.append(titlecell)
        celllist.append(bodycell)
    }
    func getcells() -> [UICollectionViewCell] {
        buildcells()
        return celllist
    }
}
