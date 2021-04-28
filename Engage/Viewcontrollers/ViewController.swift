//
//  ViewController.swift
//  Engage
//
//  Created by william Vise on 1/4/21.
//

import UIKit
import SceneKit


class ViewController: UIViewController {
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var navbartop: UINavigationBar!
    @IBOutlet weak var lilbutton: UIButton!
   
    @IBOutlet weak var page: UIPageControl!
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var debugbutton: UIButton!
    @IBOutlet weak var debug: UIButton!
    
    @IBOutlet weak var newsfeed: UIScrollView!
    
    @IBOutlet weak var form: UIImageView!

    
    
    
    @IBOutlet weak var navbak: UIImageView!
    @IBOutlet var swiperight: UISwipeGestureRecognizer!
    @IBOutlet weak var journy: UIButton!
    @IBOutlet weak var contact: UIButton!
    @IBOutlet weak var billboard: UIImageView!
 
    
    @IBOutlet weak var topline: UILabel!
    @IBOutlet weak var midline: UILabel!
    @IBOutlet weak var bottomline: UILabel!
    
    
    @IBOutlet weak var navbar: UIStackView!
    var insp = ["Its never too late to learn", "You can Go there",
                  "We're job ready!", "Prepared for the future"]
    var seen = false
    var billboardstart = CGRect()
    var step = 0
    var navitem = UINavigationItem.init(title: "Return")
    
  
    
    override func viewDidAppear(_ animated: Bool) {
        switch workingdata.menuseen {
        case false:
            initalize()
            list()
            workingdata.menuseen = true
        default:
            print("le;)")
        }
    }
    
    override func viewDidLoad() {
        
        print("main view did load")
        
        
        
        
        
        
        
        
    }
    func checklogin() {
        if workingdata.loggedin == false {
            lilbutton.isEnabled = false
            lilbutton.setTitleColor(.gray, for: .normal)
        }
        else{
            
        }
    }
    func initalize() {
        checklogin()
        billboardstart = billboard.frame
        lilbutton.contentHorizontalAlignment = .fill
        lilbutton.contentVerticalAlignment = .fill
        journy.contentHorizontalAlignment = .fill
        journy.contentVerticalAlignment = .fill
        contact.contentVerticalAlignment = .fill
        contact.contentHorizontalAlignment = .fill
        
        //scrollview.alpha = 0
        
        topline.alpha = 0
        midline.alpha = 0
        navbak.alpha = 0
        bottomline.alpha = 0
        scrollview.alpha = 0
        newsfeed.alpha = 0
      
        debug.isEnabled = false
        debug.isHidden = true
       // billboard.frame = CGRect(x: 0, y: -1000, width: 400, height: 400)
        coloring()
        billboard.alpha = 0
        
        
        var timer = Timer.scheduledTimer(timeInterval: 9, target: self, selector: #selector(anim), userInfo: nil, repeats: true)
        
    }
    @objc func anim() {
            
        UIView.animate(withDuration: 1){
            self.topline.textColor = .white
            
            self.topline.alpha = 1
            self.topline.text = self.insp[self.step]
            
            
        }
        self.step += 1
        if self.step > 3{
            self.step = 0
        }
       
    }
    
    func list() {
        UIView.animate(withDuration: 2, animations: {
            self.topline.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 1.5, animations: {
                self.midline.alpha = 1
            }, completion: { _ in
                UIView.animate(withDuration: 1, animations: {
                    //self.billboard.frame = self.billboardstart
                    self.billboard.alpha = 1
                }, completion: { _ in
                    UIView.animate(withDuration: 1, animations: {
                        self.newsfeed.alpha = 1
                        
                    }, completion: { _ in
                        UIView.animate(withDuration: 1.5, animations: {
                           
                            self.scrollview.alpha = 1
                            self.topline.alpha = 0
                            self.bottomline.alpha = 0
                            self.midline.alpha = 0
                        }, completion: { _ in
                            print("I'm done!")
                        })
                    })
                })
            })
        })
    }
    
    func coloring() {
        let chars = "GO"
        let ochars = "TAFE"
        
        let col = UIColor.orange
        let blue = UIColor.blue
        let go = [ NSAttributedString.Key.foregroundColor: col ]
        let tafe = [ NSAttributedString.Key.foregroundColor: blue]
        
        let tafetext = NSMutableAttributedString(string: ochars, attributes: tafe)
        let myNewLabelText = NSMutableAttributedString(string: chars, attributes: go)
    
        
       
       
        myNewLabelText.append(tafetext)
        
        
        bottomline.attributedText = (myNewLabelText)
        
    }
    
    @objc func quotes() {
        print("tick")
    }
  
    
    @IBAction func debugpush(_ sender: Any) {
          
     
    }
    @IBAction func swiperight(_ sender: Any) {
        debug.isEnabled = true
        debug.isHidden = false
    }
    
    
   
    
    
    
    
    
}

