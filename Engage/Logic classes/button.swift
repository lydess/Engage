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
protocol clicked {
    func buttondidclick()
}
class yesno: UIButton {
    var clickdelegate: clicked!
    var checked = false
    var yesbutton = Bool()
    var nonotclicked = UIImage(systemName: "hand.thumbsdown")
    var noclicked = UIImage(systemName: "hand.thumbsdown.fill")
    var yesclicked = UIImage(systemName: "hand.thumbsup.fill")
    var yesnotclicked = UIImage(systemName: "hand.thumbsup")
    
    @objc func click(_ sender: yesno) {
        switch sender.tag {
        case 0:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "noclicked"), object: nil)
            print("posted no")
            checked = false

        default:
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "yesclicked"), object: nil)
            checked = true
            print("posted yes")

        }
            
           
        
        
    }
    func reset() {
        self.checked = false
        if self.tag == 0{
            self.setImage(nonotclicked, for: .normal)
        }else{self.setImage(yesnotclicked, for: .normal)}
    }
}
