//
//  page1.swift
//  Engage
//
//  Created by william Vise on 1/5/21.
//

import Foundation
import UIKit

class page1: UIViewController {
   
    @IBOutlet weak var firstnamefield: UITextField!
    
    @IBOutlet weak var commentsfields: UITextView!
    @IBOutlet weak var secondnamefield: UITextField!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    var readytosend = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
    }
    func readycheck() -> Bool {
        
    }
   
    @IBAction func enquirysend(_ sender: Any) {
    }
    
}
