//
//  logincontroller.swift
//  Engage
//
//  Created by william Vise on 3/5/21.
//

import Foundation
import CoreData
import UIKit

class logincontroller: UIViewController {
    var loginstep = Int()
    var login = String()
    
    var db = DB()
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var no: yesno!
    @IBOutlet weak var yes: yesno!
    @IBOutlet weak var titletext: UILabel!
    @IBOutlet weak var textfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        no.tag = 0
        yes.tag = 1
        submit.alpha = 0
        submit.isEnabled = false
        submit.layer.cornerRadius = 15
        textfield.alpha = 0
        var loginstep = 0
    }
    func perform(answer: Bool) {
        if answer == true {
            
        
        switch loginstep {
        case 0:
            titletext.text = "Do you have a code ready to log in with?"
            loginstep += 1
        case 1:
            titletext.text = "Great, can you enter it below"
            loginstep += 1
            yes.alpha = 0
            no.alpha = 0
            textfield.alpha = 1
            submit.alpha = 1
            submit.isEnabled = true
        
        default:
            print("case overflow")
        }
            
        }else{
            switch loginstep {
            case 0:
                print("move to move to courseguide")
            case 1:
                print("move to contat")
            default:
                print("cases are broken")
            }
        }
    }
    func progress() {
        login = textfield.text ?? ""
        db.checklogin(givenname: login)
        
        if workingdata.loggedin == true {
            workingdata.loggedin = true
            print("logged in!")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "userdidlogin"), object: nil)
                dismiss(animated: true, completion: {})
            
        }else{ print("Failure")}
    }
    @IBAction func yestap(_ sender: yesno) {
        perform(answer: true)
    }
    @IBAction func notap(_ sender: yesno) {
        perform(answer: false)
    }
    @IBAction func submitpush(_ sender: Any) {
        progress()
    }
}
