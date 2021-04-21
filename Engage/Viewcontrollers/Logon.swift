//
//  Logon.swift
//  Engage
//
//  Created by william Vise on 20/4/21.
//

import Foundation
import UIKit
import SceneKit

class logon: UIViewController {
    @IBOutlet weak var profilepic: UIImageView!
    
    @IBOutlet weak var swipearrowright: UIImageView!
    @IBOutlet weak var no: UILabel!
    @IBOutlet weak var yes: UILabel!
    @IBOutlet weak var hi: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var instruction: UILabel!
    @IBOutlet weak var swipearrowleft: UIImageView!
    @IBOutlet weak var textfield: UITextField!
    
    @IBOutlet var swipeleft: UISwipeGestureRecognizer!
    @IBOutlet var swipe: UISwipeGestureRecognizer!
    var step = 0
    
    
    override func viewDidLoad() {
        print("Im alive!")
        initalize()
        
        
    }
    func flow() {
        switch step {
        case 0:
            
            var timer = Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector(self.tutorial), userInfo: nil, repeats: false)
            UIView.animate(withDuration: 5, animations: {
                self.hi.alpha = 1
                self.question.alpha = 1
                
                
            },completion:
                
                {_ in UIView.animate(withDuration: 1, animations: {
                    
            })
            
        })
            
        case 1:
            
            instruction.alpha = 1
            tutorial()
        
        default:
            print("flow is broken")
        }
        
    }
    @objc func tutorial(){
        switch step {
        case 0:
        UIView.animate(withDuration: 0.6, animations: {
            self.swipearrowright.alpha = 1
        })
        var timer = Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(self.swipesignright), userInfo: nil, repeats: false)
            
        UIView.animate(withDuration: 0.85, animations: {
        self.swipearrowright.transform = CGAffineTransform(translationX: +600, y: 0)
        }, completion: {_ in
            print("done")
    })
        case 1:
            
    UIView.animate(withDuration: 0.6,
    animations: {self.swipearrowleft.alpha = 1},
    completion: {_ in print("print done")})
            
var timer = Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(self.swipesignleft), userInfo: nil, repeats: false)
                
                
        
        
            UIView.animate(withDuration: 0.85, animations: {
            self.swipearrowleft.transform = CGAffineTransform(translationX: -600, y: 0)
            }, completion: {_ in
                print("done")})
            textfield.alpha = 1
            textfield.isEnabled = true
            
        default:
            print("bad cases")
        }
        
    }
    func initalize() {
        hi.alpha = 0
        question.alpha = 0
        instruction.alpha = 0
        textfield.alpha = 0
        textfield.isEnabled = false
        profilepic.alpha = 0
        yes.alpha = 0
        no.alpha = 0
        flow()
        swipearrowright.alpha = 0
    }
    @objc func swipesignright(){
        
        step += 1
        UIView.animate(withDuration: 1, animations: {
            
            self.yes.transform = CGAffineTransform(translationX: +50, y: -100)
        }, completion: {_ in
            //self.yes.transform = CGAffineTransform(translationX: -50, y: +100)
        })
        UIView.animate(withDuration: 0.1, animations: {
            self.yes.alpha = 1
        }, completion: {_ in
            UIView.animate(withDuration: 1.6, animations: {
                
                self.yes.alpha = 0
            })
        })
    }
    @objc func swipesignleft(){
        
        
        UIView.animate(withDuration: 1, animations: {
            
            self.no.transform = CGAffineTransform(translationX: -50, y: +100)
        }, completion: {_ in
            //self.yes.transform = CGAffineTransform(translationX: -50, y: +100)
        })
        UIView.animate(withDuration: 0.1, animations: {
            self.no.alpha = 1
        }, completion: {_ in
            UIView.animate(withDuration: 1.6, animations: {
                
                self.no.alpha = 0
            })
        })
    }
    
    func list() {
        
        UIView.animate(withDuration: 1.5, animations: {
           
        }, completion: { _ in
            UIView.animate(withDuration: 1.5, animations: {
              
            }, completion: { _ in
                UIView.animate(withDuration: 2, animations: {
                   
                }, completion: { _ in
                    UIView.animate(withDuration: 1, animations: {
                       
                        
                    }, completion: { _ in
                        UIView.animate(withDuration: 1.5, animations: {
                           
                        }, completion: { _ in
                            print("I'm done!")
                        })
                    })
                })
            })
        })
    }
    @IBAction func swiperight(_ sender: Any) {
        flow()
        
    }
    @IBAction func swipeleft(_ sender: Any) {
        performSegue(withIdentifier: "main", sender: Any?.self)
    }
}
