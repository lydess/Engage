//
//  costscontroller.swift
//  Engage
//
//  Created by william Vise on 17/5/21.
//

import Foundation
import UIKit

class costscontroller: UIViewController {
    @IBOutlet weak var contentview: UIView!
    
    @IBOutlet weak var learn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initalize()
        
    }
    
    func initalize() {
        contentview.layer.cornerRadius = 20
        
        learn.titleLabel?.numberOfLines = 5
        learn.backgroundColor = .blue
       
        learn.layer.cornerRadius = 5
    }

}


