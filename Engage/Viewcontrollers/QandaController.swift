//
//  QandaController.swift
//  Engage
//
//  Created by william Vise on 2/4/21.
//

import Foundation

import UIKit
import SceneKit
class QandaController: UIViewController, UITextFieldDelegate {
    @IBOutlet var swiper: UISwipeGestureRecognizer!
    @IBOutlet weak var yes: animbutton!
    @IBOutlet weak var no: UIButton!
    @IBOutlet weak var Submit: UIButton!
    @IBOutlet weak var textbox: animtextfield!
    @IBOutlet weak var texterror: UILabel!
    
    var data = workingdata()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(workingdata.qlist)
        print(workingdata.qtype)
        
        
    }
    
    

    @IBAction func submitpush(_ sender: Any) {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        textbox.shonk()

    }
    @IBAction func swipeleft(_ sender: Any) {
       // yes.alpha = 1
        //UIView.animate(withDuration: 0.3) {
        //    self.yes.alpha = 0
        //}
        yes.slideleft()
       // yes.fadeout()
       

        
    
    }
    
    @IBAction func rightswipe(_ sender: Any) {
        no.alpha = 1
        UIView.animate(withDuration: 0.5) {
            self.no.alpha = 0
        }
       
    
    }
    @IBAction func fallAndFade(_ sender: Any) {
        SCNTransaction.animationDuration = 1.0
        yes.alpha = 0
        
    }
    
}


