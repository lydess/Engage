//
//  subclasses.swift
//  Engage
//
//  Created by william Vise on 23/4/21.
//

import Foundation
import UIKit

class bubbleview: UIView {
    var but = "memes"
    func rndcolour() -> UIColor {
        var clr = UIColor()
        var rnd = Int.random(in: 0...4)

        switch rnd {
        case 0:
            clr = .red
        case 1:
            clr = .yellow
        case 2:
            clr = .purple
        case 3:
            clr = .cyan
        case 4:
            clr = .blue
        default:
            clr = .gray
        }
        return clr
    }
    func makebubble(inview: UIView) -> UIStackView {
        let button: UIButton = UIButton()
        let image = UIImage()
        let stack = UIStackView()
        let rightstack = UIStackView()
        
        let buttonframe = CGRect(x: 0, y: 0, width: 20, height: 30)
        let imageframe = CGRect(x: 0, y: 0, width: 180, height: 30)
        
        
        let constraintlist = [
            stack.widthAnchor.constraint(equalToConstant: 200),
            stack.heightAnchor.constraint(equalToConstant: 40),
           // button.heightAnchor.constraint(equalToConstant: 20)
            
        
        ]
        NSLayoutConstraint.activate(constraintlist)

        button.frame = buttonframe
        button.layer.cornerRadius = 6
       
        
        image.accessibilityFrame = imageframe
        
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.addArrangedSubview(button)
        
        rightstack.axis = .horizontal
        rightstack.distribution = .equalSpacing
        rightstack.addSubview(button)
        
        
        
        stack.backgroundColor = rndcolour()
        button.backgroundColor = .white
        rightstack.backgroundColor = rndcolour()
        
        
        return stack
    }
}

class commentfield: UITextField {
    var donebar = UIToolbar()
    var barbutton = UIBarButtonItem()
    
    
    func setup() {
        donebar.items?.append(barbutton)
        self.inputAccessoryView = donebar
    }
}
