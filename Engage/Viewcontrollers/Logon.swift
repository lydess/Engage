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
        uistep()
        
    }
    
    func uistep() {
        switch step {
        case 0:
            print("test")
            revealhide(time: 3)
            var timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in "print timer fired" }
            timer.fire()
            step += 1
            
        case 1:
            print("case 1")
        default:
            print("cases bad")
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
        swipearrowright.alpha = 0
        swipearrowleft.alpha = 0
        
    }

   
    
      //  var timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in }
        
    
   
    @IBAction func swiperight(_ sender: Any) {
        print("swipe right")
        
    }
    @IBAction func swipeleft(_ sender: Any) {
        performSegue(withIdentifier: "main", sender: Any?.self)
    }
    
    func revealright(time:Double) -> Void {
        let animation: Void = UIView.animate(withDuration: time, animations: {
            self.swipearrowright.alpha = 1
        }
        )
        return animation
        
    }
    
    func moveright(time:Double) -> Void {
        let animation: Void = UIView.animate(withDuration: time, animations: {
            self.swipearrowright.transform = CGAffineTransform(translationX: +900, y: 0)
        }
        )
        return animation
        
    }
    
    func revealhide(time:Double) -> Void {
        let test: Void = UIView.animate(withDuration: time, animations: {
            self.hi.alpha = 1
            
        }
        )
        return test
    }
    
    
}
