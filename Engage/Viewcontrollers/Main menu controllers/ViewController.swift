//
//  ViewController.swift
//  Engage
//
//  Created by william Vise on 1/4/21.
//

import UIKit
import SceneKit
import Foundation

class ViewController: UIViewController  {

    @IBOutlet weak var buttonstack: UIStackView!
    @IBOutlet weak var debug: UIButton!
    @IBOutlet weak var courses: UIButton!
    @IBOutlet var swiperight: UISwipeGestureRecognizer!
    @IBOutlet weak var Applications: UIButton!
    @IBOutlet weak var billboard: UIImageView!
    @IBOutlet weak var topline: UILabel!
    @IBOutlet weak var midline: UILabel!
    @IBOutlet weak var loginbutton: UIButton!
    @IBOutlet weak var contact: UIButton!
    @IBOutlet weak var loginurldebug: UILabel!
    @IBOutlet weak var community: UIButton!
    var billboardstart = CGRect()
    var step = 0
    var results = possiblErrors.errorlist.self
    var navitem = UINavigationItem.init(title: "Return")
    var url = [UIApplication.LaunchOptionsKey : Any]()

    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(login), name: NSNotification.Name(rawValue: "userdidlogin"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(whenmadeactive), name: UIApplication.didBecomeActiveNotification, object: nil)
   
        switch workingdata.menuseen {
        case false:
            initalize()
            list()
            setloginUI()
            workingdata.menuseen = true
            
        default:
            print("")
            
        }
        
    
    }
    func setloginUI() {
        if workingdata.loginstatus == .loggedout {
            Applications.isEnabled = false
            Applications.tintColor = .gray
            Applications.setTitleColor(.gray, for: .normal)
            
            
        }
        else{
            Applications.isEnabled = true
            Applications.tintColor = .white
            Applications.setTitleColor(.orange, for: .normal)
            loginbutton.setTitle("   Linked", for: .normal)
            loginbutton.isEnabled = false
            loginbutton.tintColor = .gray
            loginbutton.titleLabel?.textColor = .gray
            
            
            
        }
    }
    func initalize() {
        setloginUI()
        billboardstart = billboard.frame
    
        midline.alpha = 0
        topline.alpha = 0
        
        courses.titleLabel?.adjustsFontSizeToFitWidth = true
        contact.titleLabel?.adjustsFontSizeToFitWidth = true
        Applications.titleLabel?.adjustsFontSizeToFitWidth = true
        community.titleLabel?.adjustsFontSizeToFitWidth = true
        
        loginurldebug.alpha = 0
        buttonstack.alpha = 0
        
        debug.alpha = 0
        debug.isEnabled = false
        debug.isHidden = true
       // billboard.frame = CGRect(x: 0, y: -1000, width: 400, height: 400)
        
        billboard.alpha = 0
          
    }
    
    func list() {
        UIView.animate(withDuration: 1, animations: {
            self.topline.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 0.75, animations: {
                self.midline.alpha = 1
            }, completion: { _ in
                UIView.animate(withDuration: 1, animations: {
                    //self.billboard.frame = self.billboardstart
                    self.billboard.alpha = 1
                   
                }, completion: { _ in
                    UIView.animate(withDuration: 0.5, animations: {
                        self.topline.transform.translatedBy(x: 200, y: 200)
                    }, completion: { _ in
                        UIView.animate(withDuration: 0.75, animations: {
                           
                            
                            self.topline.alpha = 0
                            
                            self.midline.alpha = 0
                            self.buttonstack.alpha = 1
                            
                        }, completion: { _ in
                            self.topline.isEnabled = false
                            self.midline.isEnabled = false
                        })
                    })
                })
            })
        })
    }
    
    
    
    @objc func quotes() {
        print("tick")
    }
    @objc func login() {
        print("re-enabling application")
        setloginUI()
        
    }
  
    @objc func whenmadeactive() {
        setloginUI()
        
        if workingdata.urlinfo.isEmpty == false {
            loginurldebug.text = workingdata.urlinfo[0]
        }
        else {
            print("User logged in without using a url")
        }
        
    }
    
    
    
    @IBAction func debugpush(_ sender: Any) {
     
    }
    @IBAction func swiperight(_ sender: Any) {
        
            debug.isEnabled = true
            debug.isHidden = false
            debug.alpha = 1
            loginurldebug.alpha = 1
        
        
    }
    
    @IBAction func newspush(_ sender: Any) {
        if workingdata.shownews == true{
            workingdata.shownews = false
        }else {workingdata.shownews = true}
       
    }
    
   
    
    
    
    
    
}

