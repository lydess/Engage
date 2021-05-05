//
//  page1.swift
//  Engage
//
//  Created by william Vise on 1/5/21.
//

import Foundation
import UIKit

class page1: UIViewController {
   
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var firstnamefield: UITextField!
    
    
    @IBOutlet var tapdown: UITapGestureRecognizer!
    
    @IBOutlet weak var secondnamefield: UITextField!
    
   
    @IBOutlet weak var datepicker: UIDatePicker!
    
    var readytosend = false
    var db = DB()
    let alert = UIAlertController(title: "Enquiry sent!", message: "You've already filled out a questions form, so we will just use that!", preferredStyle: .alert)
    let regular = UIAlertController(title: "Enquiry sent!", message: "Check out the applications menu to follow your progress", preferredStyle: .alert)
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: {_ in self.gohome()}))
        regular.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: {_ in self.gohome()}))
        datepicker.backgroundColor = .white
        datepicker.layer.cornerRadius = 10
        textview.backgroundColor = .white
                
        
    }
    func readycheck() -> Bool {
        if firstnamefield.text == "" || secondnamefield.text == "" {
            print("context fakse")
            return false
        }else{
            print("cotext true")
            return true
            
        }
    }
    func gohome() {
        
        performSegue(withIdentifier: "gohome", sender: Any.self)
    }
    func timerset() {
        var timer = Timer.scheduledTimer(withTimeInterval: 0.025, repeats: false) { timer in self.gohome()}
        
    }
   
    @IBAction func enquirysend(_ sender: Any) {
        if workingdata.loggedin == false {
        if readycheck() == false{
            print("data missing")
        }else{
            db.sendapp(course: workingdata.usercourse, username: firstnamefield.text!)
            db.checklogin(givenname: firstnamefield.text!)
            workingdata.loggedin = true
            self.present(regular, animated: true, completion: timerset)
            
            
        }
        }else{
            self.present(alert, animated: true, completion: timerset)
            
            
        }
    }
    
    
    @IBAction func tap(_ sender: Any) {
        view.endEditing(true)
    }
    
}
