//
//  ViewController.swift
//  Engage
//
//  Created by william Vise on 1/4/21.
//

import UIKit

class ViewController: UIViewController {
    var data = workingdata()
    
    @IBOutlet weak var Formfillerbutton: UIButton!
    
    
    override func viewDidLoad() {
        var data = workingdata()
        data.callval()
        super.viewDidLoad()
        
        
        
    }


}

