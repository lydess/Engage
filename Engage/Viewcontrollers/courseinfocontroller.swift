//
//  courseinfocontroller.swift
//  Engage
//
//  Created by william Vise on 29/4/21.
//

import Foundation
import  UIKit

class courseinfoviewcontroller: UIViewController {
    @IBOutlet weak var topbar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("welcome to course info")
        initalize()
    }
    
    func initalize() {
        topbar.layer.shadowOffset = .init(width: 500, height: 500)
        
    }
}
