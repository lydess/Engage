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
    @IBOutlet weak var yes: yesno!
    @IBOutlet weak var no: yesno!
    @IBOutlet weak var textbox: animtextfield!
    @IBOutlet weak var texterror: UILabel!
    @IBOutlet weak var labelt: UILabel!
    @IBOutlet weak var labelstack: UIStackView!
    @IBOutlet weak var qtext: UILabel!
    @IBOutlet weak var debug: UIButton!
    @IBOutlet weak var button: checkbox!
    @IBOutlet weak var scrollv: UIScrollView!
    
    @IBOutlet weak var sview: UIView!
    
    
    
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
        yes.tag = 1
        no.tag = 0
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
            
        }
        else {
            textbox.alpha = 0
            textbox.isEnabled = false
           
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
    //resets the UI and advances the question step
    func reload() {
        step += 1
        
        for x in activecbx {
            x.isHidden = true
            labelstack.removeArrangedSubview(x)
        }
        activecbx = [checkbox]()
        print("reloading")
        uistep()
        no.checked = false
        yes.checked = false
        
        
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
    
    // Loads the UI based on what type of question is being asked
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
        print(step)
        var qray = workingdata.qcbx[step]
        qtext.text = workingdata.qlist[step]
        for x in 0...qray.count-1 {
            
            var text = workingdata.qcbx[step][x]
            buttongen(text: text)
            
        }
        
        
        
        
        
    }
    func case4() {
        yesno(Boolean: false)
        submit(istrue: false)
        labelstack.isHidden = false
        labelstack.alpha = 1
        print(step)
        
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
        for x in activecbx {
            if x.checked == true {
            print(x.titleLabel?.text!)
            }
            
        }
        print(answer)
        
    }

    
    
    @objc func testfunc(sender: checkbox) {
        var jack = String(sender.title(for: .normal)!)
        let pic = UIImage.init(named: "ticked")
        let opic = UIImage.init(named: "unticked")
        switch sender.checked {
        case true:
            sender.setImage(opic, for: .normal)
            sender.checked = false
            
        case false:
            sender.setImage(pic, for: .normal)
            sender.checked = true
            
           
        default:
            print("somthing is seriously wrong")
        }
        
        
        for x in 0...1{
            jack.remove(at: jack.startIndex)
        }
        
        //reload()
        
        
    }
    // controls the swipe right to save answer functionality ONLY SAVE DATA TO THE ANSWERLIST FROM HERE
    @IBAction func rightswipe(_ sender: Any) {
        switch self.qtype[step] {
        case 0:
            if yes.checked {
                answer.add(1)
                reload()
            }
            if no.checked {
                answer.add(0)
                reload()
            }
        case 1:
            if textbox.text?.isEmpty == true {
                print("answer not given")
                
            }
            else{
                answer.add(textbox.text!)
                reload()
            }
            
            
        case 2:
            var answerlist = [String]()
            for x in activecbx{
                if x.checked == true{
                    answerlist.append(x.titleLabel!.text!)
                }
            
            }
            if answerlist.count != 1 {
                print("ERROR")
            }
            if answerlist.count == 1{
                answer.add(answerlist[0])
                reload()
            }
            
            
        case 3:
            var answerlist = [String]()
            for x in activecbx{
                if x.checked == true{
                    answerlist.append(x.titleLabel!.text!)
                }
            
            }
            if answerlist.count < 1 {
                print("Please select an answer")
            }
            else{
                answer.add(answerlist)
                reload()
            }
            
            
        
        default:
            print("somthings wrong with your cases man")
        }
        
        
        if answer.count < step {
            print(step)
            print(answer.count)
            print("answer was not given")
        }
        if answer.count > step {
            print("answerpool has been corrupted")
            
            print("answers in pool" + String(answer.count))
            print("current step" + String(step))
            print("answer list")
            print(answer)
            
            
            
        }
    
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
    
    @IBAction func nopush(_ sender: Any) {
        no.click(no)
    }
    
    @IBAction func yespush(_ sender: Any) {
        yes.click(yes)
        
    }
    
}



