//
//  debugcontroller.swift
//  Engage
//
//  Created by william Vise on 17/4/21.
//

import Foundation


import UIKit
import SceneKit

class debugcontroller: UIViewController {
    
    @IBOutlet weak var toplabel: UILabel!
    @IBOutlet weak var debug1: UIButton!
    
    
    @IBOutlet weak var testview: UIStackView!
    
    @IBAction func debug1push(_ sender: Any) {
        print("Hello world")
    }
}
