//
//  button.swift
//  Engage
//
//  Created by william Vise on 7/4/21.
//

import Foundation
import UIKit

class checkbox: UIButton {
    var photo = UIImage.init(imageLiteralResourceName: "ticked")
    var unticked = UIImage.init(imageLiteralResourceName: "unticked")
   var checked = false
    var btest = true
    func click() {
        //self.addTarget(self, action: #selector(testfunc), for: .touchUpInside)
    }
    @objc func testfunc(_ sender: checkbox) {
        switch checked {
        case false:
            self.setImage(photo, for: .normal)
            checked = true
        case true:
            self.setImage(unticked, for: .normal)
            checked = false
        default:
            print("somthing is seriously wrong")
            
        }
        
        
        
        
    
       
        
        
    }
}
