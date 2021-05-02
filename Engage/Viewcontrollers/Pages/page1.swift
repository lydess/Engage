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
    var db = DB()
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
    }
    func readycheck() -> Bool {
        if firstnamefield.text == "" || secondnamefield.text == "" || commentsfields.text == "" {
            print("context fakse")
            return false
        }else{
            print("cotext true")
            return true
            
        }
    }
   
    @IBAction func enquirysend(_ sender: Any) {
        if readycheck() == false{
            print("data missing")
        }else{
            db.sendapp(course: workingdata.usercourse, username: firstnamefield.text!)
            db.checklogin(givenname: firstnamefield.text!)
            workingdata.loggedin = true
            
        }
    }
    
}
