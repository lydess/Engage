//
//  ViewController.swift
//  Engage
//
//  Created by william Vise on 1/4/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var debugbutton: UIButton!
    @IBOutlet weak var Formfillerbutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(workingdata.doc)
        print()
        
        
        
        
    }

    @IBAction func debugpush(_ sender: Any) {
        workingdata.doc = 5
        print(workingdata.doc)
     
    }
    
}

