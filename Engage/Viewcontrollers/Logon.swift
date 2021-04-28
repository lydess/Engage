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
    
    @IBOutlet weak var swipearrowleft: UIImageView!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet var touchdown: UITapGestureRecognizer!
    
    
    @IBOutlet weak var skipbutton: UIButton!
    @IBOutlet var swipeleft: UISwipeGestureRecognizer!
    @IBOutlet var swipe: UISwipeGestureRecognizer!
    var step = 0
    @IBOutlet weak var error: UILabel!
    @IBOutlet weak var thumbs: UIStackView!
    
    
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
            //righttutorial(time: 3)
            
            step += 1
            var timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in self.uistep() }
            
        case 1:
            revealbox(time: 1)
        default:
            print("cases bad")
        }
    }
    func initalize() {
        hi.alpha = 0
        question.alpha = 0
        error.alpha = 0
        
        textfield.alpha = 0
        textfield.isEnabled = false
        profilepic.alpha = 0
        
        swipearrowright.alpha = 0
        swipearrowleft.alpha = 0
        thumbs.alpha = 0
        thumbs.isUserInteractionEnabled = false
        skipbutton.alpha = 0
        
    }

   
    @IBAction func skipbutton(_ sender: Any) {
        
    }
    
      //  var timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in }
        
    
   
    @IBAction func swiperight(_ sender: Any) {
        print("swipe right")
        
    }
    @IBAction func swipeleft(_ sender: Any) {
        skipbutton.alpha = 1
    }
    
    @IBAction func thumbdown(_ sender: Any) {
        performSegue(withIdentifier: "main", sender: Any?.self)
    }
    
    @IBAction func thumbup(_ sender: Any) {
        thumbyes(time: 3)
        let animation: Void = UIView.animate(withDuration: 2, animations: {
            self.profilepic.alpha = 1
            self.question.text = "Great, can you enter it here?"
        }
        )
        
    }
    
    func revealbox(time:Double){
        var timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { timer in self.revealthumbs() }
        let animation: Void = UIView.animate(withDuration: time, animations: {
            self.question.alpha = 1
        }
        )
        
        
    }
    func revealthumbs() {
        let anim = UIView.animate(withDuration: 0.75, animations: {
            self.thumbs.alpha = 1
            self.thumbs.isUserInteractionEnabled = true
            
        }
        )
    }

    
    func revealhide(time:Double) -> Void {
        let test: Void = UIView.animate(withDuration: time, animations: {
            self.hi.alpha = 1
            
        }
        )
        return test
    }
    
    func thumbanim() {
        yes.alpha = 1
        let thumb = UIView.animate(withDuration: 0.5, animations: {self.yes.transform = CGAffineTransform(translationX: +37.5, y: -75)}, completion: {_ in UIView.animate(withDuration: 0.5, animations: {self.yes.transform = CGAffineTransform(translationX: +100, y: +60)})})
        
    }
    func thumbhide() {
        UIView.animate(withDuration: 1, animations: {self.yes.alpha = 0})
    }
    func thumbyes(time: Int) {
        
        var timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in self.revealtbox(time: 1) }
        
    }
    func revealtbox(time: Int) {
        
        let animation: Void = UIView.animate(withDuration: TimeInterval(time), animations: {
            self.textfield.alpha = 1
            self.textfield.isEnabled = true
        }
        )
        
    }
    
    @IBAction func slideup(_ sender: Any) {
        print("")
        UIView.animate(withDuration: 2, animations: {self.textfield.transform.translatedBy(x: 123, y: -200)})
        
    }
    @IBAction func check(_ sender: Any) {
        print("editing finished")
        if textfield.text == "xcom"{
            workingdata.loggedin = true
            performSegue(withIdentifier: "main", sender: (Any).self)
        }
        else{
            error.alpha = 1
            var timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { timer in self.alpha() }
        }
        
    }
    func alpha() {
        error.alpha = 0
    }
    @IBAction func tapdown(_ sender: Any) {
        textfield.endEditing(true)
    }
    @IBAction func debug(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {self.textfield.transform.rotated(by: 120)
        
    })
}
}
