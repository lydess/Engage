//
//  workingdata.swift
//  Engage
//
//  Created by william Vise on 2/4/21.
//

import Foundation
import UIKit

class workingdata {
    var _workingdoc = "workingdoc"
    var workingdoc:String {
        get {
            return _workingdoc
        }
        set (newval) {
            _workingdoc = newval
        }
    }
    func callval() {
        print(workingdoc)
    }
}
