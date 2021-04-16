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

class yesno: UIButton {
    var checked = false
    var noturnonpic = UIImage.init(imageLiteralResourceName: "nochecked")
    var noturnoffpic = UIImage.init(imageLiteralResourceName: "nobutton")
    var yesturnonpic = UIImage.init(imageLiteralResourceName: "yesticked")
    var yesturnoffpic = UIImage.init(imageLiteralResourceName: "yesbutton")
    
    @objc func click(_ sender: yesno) {
        
        switch checked {
        case false:
            if self.tag == 0 {
            self.setImage(noturnonpic, for: .normal)
            }
            else if self.tag == 1{
                self.setImage(yesturnonpic, for: .normal)
            }
            checked = true
        case true:
            if self.tag == 0 {
            self.setImage(noturnoffpic, for: .normal)
            }
            else if self.tag == 1 {
                self.setImage(yesturnoffpic, for: .normal)
            }
            checked = false
            
        default:
            print("somthing is seriously wrong")
            
        }
}
}
