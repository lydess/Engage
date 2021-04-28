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
    var isother = false
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

class yesno: UIButton {
    var checked = false
    
    var noimg = UIImage.init(named: "hand.thumbsup.fill")
    
    var yesimg = UIImage.init(named: "hand.thumbsup")
    
    @objc func click(_ sender: yesno) {
        
        switch checked {
        case false:
            checked = true
            self.setImage(noimg, for: .normal)
        case true:
            checked = false
            
        default:
            print("somthing is seriously wrong")
            
        }
}
}
