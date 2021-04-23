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
    
    func makebubble(inview: UIView) -> UIStackView {
       let button: UIButton = UIButton()
       let image = UIImage()
       let stack = UIStackView()
       let buttonframe = CGRect(x: 0, y: 0, width: 20, height: 30)
       let imageframe = CGRect(x: 0, y: 0, width: 180, height: 30)
        
        let constraintlist = [
            button.widthAnchor.constraint(equalToConstant: 20),
            button.heightAnchor.constraint(equalToConstant: 30),
            
        
        ]
        NSLayoutConstraint.activate(constraintlist)

        button.frame = buttonframe
        button.layer.cornerRadius = 30
        button.backgroundColor = .red
        
        image.accessibilityFrame = imageframe
        
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        
        stack.addArrangedSubview(button)
        stack.backgroundColor = .red
        
        
        return stack
    }
}
