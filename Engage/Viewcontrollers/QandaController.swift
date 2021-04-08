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
    @IBOutlet weak var labelt: UILabel!
    @IBOutlet weak var labelstack: UIStackView!
    @IBOutlet weak var qtext: UILabel!
    @IBOutlet weak var debug: UIButton!
    @IBOutlet weak var button: checkbox!
    @IBOutlet weak var scrollv: UIScrollView!
    
    
    @IBOutlet var tapges: UITapGestureRecognizer!
    
    var data = workingdata()
    var cords = CGRect.init(x: 100, y: 100, width: 50, height: 50)
    var queue = [String]()
    var answer = NSMutableArray()
    var qtype = [Int]()
    var step = 0
    var activecbx = [checkbox]()
    //TODO: add logic to check for an existing form being filled out
    override func viewDidLoad() {
        super.viewDidLoad()
        if workingdata.isworking == true {
            resume()
        }
        else{
            yes.isEnabled = false
            yes.alpha = 0
            no.isEnabled = false
            no.alpha = 0
            textbox.isEnabled = false
            textbox.alpha = 0
            Submit.isEnabled = false
            Submit.alpha = 0
            labelstack.alpha = 0
            
            startup()
        }
        
       
        
        
    }
    
    func yesno(Boolean:Bool) {
        if Boolean == true {
            yes.alpha = 1
            no.alpha = 1
            yes.isEnabled = true
            no.isEnabled = true
        }
        else {
            yes.alpha = 0
            no.alpha = 0
            no.isEnabled = false
            yes.isEnabled = false
        }
    }

    func submit(istrue:Bool) {
        if istrue == true {
            textbox.alpha = 1
            textbox.isEnabled = true
            Submit.isEnabled = true
            Submit.alpha = 1
        }
        else {
            textbox.alpha = 0
            textbox.isEnabled = false
            Submit.alpha = 0
            Submit.isEnabled = false
        }
    }
    func startup() {
        queue = workingdata.qlist
        qtype = workingdata.qtype
        print(workingdata.qlist)
        print(workingdata.qtype)
        self.step = 0
        uistep()
        
    }
    func reload() {
        step += 1
        activecbx = [checkbox]()
        print("reloading")
        uistep()
        
    }
    func uistep() {
        
        switch qtype[step] {
        case 0:
             case0()
        case 1:
            case1()
        case 2:
            case2()
        case 3:
            case3()
        case 4:
            print("case 4")
        default:
            print("case 1")
        }
    }
    func resume() {
        
    }
    
    // loads the UI for a yes/no question
    func case0() {
        yesno(Boolean: true)
        submit(istrue: false)
        qtext.text = workingdata.qlist[step]
        print("case 0")
    }
    func case1() {
        yesno(Boolean: false)
        submit(istrue: true)
        labelstack.isHidden = true
        qtext.text = workingdata.qlist[step]
        print("case 1")
        
    }
    func case2() {
        yesno(Boolean: false)
        submit(istrue: false)
        labelstack.isHidden = false
        labelstack.alpha = 1
        var qray = workingdata.qcbx[step]
        qtext.text = workingdata.qlist[step]
        for x in 0...qray.count-1 {
            var text = workingdata.qcbx[step][x]
            buttongen(text: text)
            
        }
        print("case 2")
        
    }
    func case3() {
        yesno(Boolean: false)
        submit(istrue: false)
        labelstack.isHidden = false
        labelstack.alpha = 1
        
        qtext.text = workingdata.qlist[step]
        
        
        
    }
    // programaticly creates a button
    func buttongen(text: String) -> checkbox {
        let pic = UIImage.init(named: "unticked")
        let button = checkbox(frame: CGRect(x: 100, y:100, width: 100, height: 20))
        button.backgroundColor = .clear
        button.setTitleColor(.black, for: .normal)
        button.setImage(pic, for: .normal)
        button.setTitle("  " + text, for: .normal)
        button.addTarget(self, action: #selector(testfunc), for: .touchUpInside)
        activecbx.append(button)
        labelstack.addArrangedSubview(button)
        return button
    }
    
    
 
    @IBAction func debugpush(_ sender: Any) {
        print(activecbx)
    }
    @IBAction func submitpush(_ sender: Any) {
        answer.add(textbox.text)
        reload()

    }
    @IBAction func swipeleft(_ sender: Any) {
        yes.alpha = 0
        yes.isEnabled = false
        yes.slideleft()
        yes.fadeout()
       

        
    
    }
    @objc func testfunc(sender: checkbox) {
        var jack = String(sender.title(for: .normal)!)
        let pic = UIImage.init(named: "ticked")
        let opic = UIImage.init(named: "unticked")
        switch sender.checked {
        case true:
            sender.setImage(opic, for: .normal)
            sender.checked = false
            print("state is true")
        case false:
            sender.setImage(pic, for: .normal)
            sender.checked = true
            print("state is false")
           
        default:
            print("somthing is seriously wrong")
        }
        
        
        for x in 0...1{
            jack.remove(at: jack.startIndex)
        }
        answer.add(jack)
        //reload()
        
        
    }
    
    @IBAction func rightswipe(_ sender: Any) {
        no.alpha = 1
        UIView.animate(withDuration: 0.5) {
            self.no.alpha = 0
        }
       
    
    }
    @IBAction func nopush(_ sender: Any) {
        answer.add(0)
        reload()
    }
    
    @IBAction func yespush(_ sender: Any) {
        answer.add(1)
        reload()
    }
    
    @IBAction func fallAndFade(_ sender: Any) {
        SCNTransaction.animationDuration = 1.0
        yes.alpha = 0
        
    }
    func yesnostart(button:UIButton) {
        UIView.animate(withDuration: 0) {
            self.yes.transform = CGAffineTransform(translationX: 0, y: 0)
            self.yes.alpha = 1
        }
        yes.isEnabled = true
        no.alpha = 1
        no.isEnabled = false
        
        
        
    }
    
    @IBAction func taptest(_ sender: Any) {
        print("text")
    }
    
}



