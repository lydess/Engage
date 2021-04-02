//
//  Animation test.swift
//  Engage
//
//  Created by william Vise on 3/4/21.
//

import Foundation
import UIKit

class animtextfield: UITextField {
    func shonk() {
        let anim = CABasicAnimation(keyPath: "position")
        anim.duration = 0.05
        anim.repeatCount = 4
        anim.autoreverses = true
        anim.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4, y: self.center.y))
        
        self.layer.add(anim, forKey: "position")
}
}

class animbutton: UIButton {
    func slideleft() {
        let anim = CABasicAnimation(keyPath: "position")
        anim.duration = 0.3
        anim.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5, y: self.center.y))
        anim.toValue = NSValue(cgPoint: CGPoint(x: self.center.x - 400, y: self.center.y))
        
        
        
        
        
        self.layer.add(anim, forKey: "position")
        
    
        
}
    func fadeout() {
        let opac = CABasicAnimation(keyPath: "opacity")
        opac.duration = 1
        opac.fromValue = 1
        opac.toValue = 0
        
        self.layer.add(opac, forKey: "opacity")
    }
}
