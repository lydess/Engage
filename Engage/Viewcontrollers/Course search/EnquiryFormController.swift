//
//  page1.swift
//  Engage
//
//  Created by william Vise on 1/5/21.
//

import Foundation
import UIKit

class EnquiryFormController: UIViewController {
   
    @IBOutlet weak var textview: UITextView!
    @IBOutlet weak var firstnamefield: UITextField!
    @IBOutlet weak var header: UIImageView!
    @IBOutlet var tapdown: UITapGestureRecognizer!
    @IBOutlet weak var secondnamefield: UITextField!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var barbutton: UIBarButtonItem!
    @IBOutlet weak var datepicker: UIDatePicker!
    
    var readyToSend = false
    var db = DB()
    var colorTemplates = colors()
    let alert = UIAlertController(title: "Enquiry sent!", message: "You've already filled out a questions form, so we will just use that!", preferredStyle: .alert)
    let regular = UIAlertController(title: "Enquiry sent!", message: "Check out the applications menu to follow your progress", preferredStyle: .alert)
    

   
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: {_ in self.gohome()}))
        regular.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: {_ in self.gohome()}))
        
        NotificationCenter.default.addObserver(self, selector: #selector(toolbarshow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(toolbarhide), name: UIResponder.keyboardWillShowNotification, object: nil)
                
        
    }
    func initalize() {
        
      
        datepicker.tintColor = .black
        datepicker.layer.cornerRadius = 10
        textview.backgroundColor = .white
        textview.inputAccessoryView = toolbar
        header.backgroundColor = .red
    }
    
    func checkRequiredFields() -> Bool {
        if firstnamefield.text == "" || secondnamefield.text == "" {
            return false
        } else {
            return true
            
        }
    }
    func gohome() {
        
        performSegue(withIdentifier: "gohome", sender: Any.self)
    }
    func timerset() {
        var timer = Timer.scheduledTimer(withTimeInterval: 0.025, repeats: false) { timer in self.gohome()}
        
    }
    func textapply() {
        
        
        
        
    }
    @objc func toolbarshow() {
        toolbar.alpha = 1
    }
    @objc func toolbarhide() {
        toolbar.alpha = 0
    }
   
    @IBAction func enquirysend(_ sender: Any) {
        if workingdata.loginstatus == .loggedout {
        if checkRequiredFields() == false{
            var alert = UIAlertController(title: "Incomplete", message: "Please fill in all required forms", preferredStyle: .alert)
            var action = UIAlertAction(title: "Okay", style: .default, handler: {_ in })
            alert.addAction(action)
            present(alert, animated: true, completion: {})
        }else{
            db.sendapp(course: workingdata.usercourse, username: firstnamefield.text!)
            db.checkIfUserDuplicate(givenname: firstnamefield.text!)
            workingdata.loginstatus = .loggedin
            self.present(regular, animated: true, completion: timerset)
            
            
        }
        }else{
            self.present(alert, animated: true, completion: timerset)
            
            
        }
    }
    
    
    @IBAction func tap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func Done(_ sender: Any) {
        view.endEditing(true)
        toolbar.alpha = 0
    }
    
}
