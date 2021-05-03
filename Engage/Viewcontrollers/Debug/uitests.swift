//
//  uitests.swift
//  Engage
//
//  Created by william Vise on 3/5/21.
//

import Foundation
import UIKit

class uitestcontroller: UIViewController {
    @IBOutlet weak var slider: UISegmentedControl!
    
    override func viewDidLoad() {
        slider.setTitle("balls", forSegmentAt: 3)
        
        let example = UIAction(title: "action", identifier: .none, discoverabilityTitle: "hi", attributes: .destructive, state: .on, handler: {_ in self.print()})
        slider.setAction(example, forSegmentAt: 1)
        
    }
    func print() {
        
        Swift.print("hello world")
    }
}
