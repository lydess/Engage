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
    @IBOutlet weak var yes: yesno!
    @IBOutlet weak var no: yesno!
    @IBOutlet weak var textbox: animtextfield!
    @IBOutlet weak var texterror: UILabel!
    @IBOutlet weak var qtext: UILabel!
    @IBOutlet weak var debug: UIButton!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var yesnocontainer: UIStackView!
    

    var data = workingdata()
    var cords = CGRect.init(x: 100, y: 100, width: 50, height: 50)
    var queue = [String]()
    var answer = NSMutableArray()
    var qtype = [Any]()
    var step = 0
    var activecbx = [checkbox]()
    var genstack = UIStackView()
    var rightgenstack = UIStackView()
    var sidetoadd = true
    var activebut = [UIStackView]()
    var tboxpool = [UITextField]()
    var tlabel = [UILabel]()
    var stackheight = 30
    var rightstackheight = 30
    var complete = false
    var givenanswer = Bool()
    
    

    //TODO: add logic to check for an existing form being filled out
    override func viewDidLoad() {
        super.viewDidLoad()
        yes.tag = 1
        no.tag = 0
        submit.layer.cornerRadius = 20
        yes.imageView?.contentMode = .scaleAspectFill
        no.imageView?.contentMode = .scaleToFill
        
       

        yes.yesbutton = true
        no.yesbutton = false
        
        genstack.axis = .vertical
        genstack.spacing = 5
        genstack.alignment = .top
        genstack.frame = CGRect(x: 20, y: 150, width: 150, height: self.stackheight)
        genstack.distribution = .fillEqually
        genstack.isHidden = true
        
       
        rightgenstack.axis = .vertical
        rightgenstack.spacing = 5
        rightgenstack.alignment = .top
        rightgenstack.frame = CGRect(x: 220  , y: 150, width: 180, height: self.rightstackheight)
        rightgenstack.distribution = .fillEqually
        rightgenstack.isHidden = true
        
        
        yes.isEnabled = false
        yes.alpha = 0
        no.isEnabled = false
        no.alpha = 0
        textbox.isEnabled = false
        textbox.alpha = 0
        yes.contentHorizontalAlignment = .fill
        no.contentHorizontalAlignment = .fill
        yes.contentVerticalAlignment = .fill
        no.contentVerticalAlignment = .fill
        
        
        

        
        if workingdata.isworking == true {
            resume()
        }
        else{
            startup()
        }
        
        if isModalInPresentation == true {
            print("is modal")
        }
        
        self.view.addSubview(genstack)
        self.view.addSubview(rightgenstack)
        
        
    }
    func isTrueFalse(Boolean:Bool) {
        if Boolean == true {
       
            
            yes.alpha = 1
            no.alpha = 1
            yes.isEnabled = true
            no.isEnabled = true
            givenanswer = Bool()
           
            submit.alpha = 0
        }
        else {
            yes.alpha = 0
            no.alpha = 0
            no.isEnabled = false
            yes.isEnabled = false
            submit.alpha = 0
        }
    }

    func isTextBox(istrue:Bool) {
        if istrue == true {
            textbox.alpha = 1
            textbox.isEnabled = true
            submit.alpha = 1
            submit.isHidden = false
            
        }
        else {
            textbox.alpha = 0
            textbox.isEnabled = false
            submit.alpha = 0
            submit.isHidden = true
           
        }
    }
    func isCheckBox(Boolean:Bool) {
        if Boolean == true {
            genstack.isHidden = false
            genstack.alpha = 1
            rightgenstack.isHidden = false
            rightgenstack.alpha = 1
            submit.alpha = 1
            submit.isHidden = false
        } else {
            genstack.isHidden = true
            genstack.alpha = 0
            rightgenstack.isHidden = true
            rightgenstack.alpha = 0
            
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
    func arrange() {
        view.bringSubviewToFront(yesnocontainer)
        view.sendSubviewToBack(genstack)
        view.sendSubviewToBack(rightgenstack)
        view.sendSubviewToBack(background)
    }
    //resets the UI and advances the question step
    func reload() {
        step += 1
        self.stackheight = 60
        self.rightstackheight = 60
        
        tlabel.removeAll()
        for x in activebut {
            x.isHidden = true
            rightgenstack.removeArrangedSubview(x)
            genstack.removeArrangedSubview(x)
        }
        activecbx = [checkbox]()
        print("reloading")
        uistep()
        no.checked = false
        yes.checked = false
        workingdata.resumedlist = answer
        workingdata.resumedstep = step
        arrange()
    }
    
    func resume() {
        queue = workingdata.qlist
        qtype = workingdata.qtype
        step = workingdata.resumedstep
        uistep()
    }
//    @objc func slidedown() {
//        workingdata.qlist = queue
//        workingdata.qtype = qtype
//        workingdata.resumedstep = step
//
//    }
    func uistep() {
        
        switch qtype[step] {
        case workingdata.questiontypes.trueFalse:
             case0()
        case workingdata.questiontypes.textBox:
            case1()
        case workingdata.questiontypes.checkBox:
            case2()
        case workingdata.questiontypes.checkBoxOther:
            case3()
        case workingdata.questiontypes.checkBoxmulti:
            case4()
        case workingdata.questiontypes.formCompelte:
            case5()
        default:
        print("memes")
            
        }
    }
    
    
    // Loads the UI based on what type of question is being asked
    func case0() {
        isTrueFalse(Boolean: true)
        isTextBox(istrue: false)
        isCheckBox(Boolean: false)
        
        qtext.text = workingdata.qlist[step]
        
    }
    func case1() {
        isTrueFalse(Boolean: false)
        isTextBox(istrue: true)
        isCheckBox(Boolean: false)
        
        qtext.text = workingdata.qlist[step]
        
        
    }
    func case2() {
        isTrueFalse(Boolean: false)
        isTextBox(istrue: false)
        isCheckBox(Boolean: true)
        
        qtext.text = workingdata.qlist[step]
        
        let checkBoxQuestions = workingdata.checkBoxQuestions[step]
        qtext.text = workingdata.qlist[step]
        for x in 0...checkBoxQuestions.count-1 {
            let text = workingdata.checkBoxQuestions[step][x]
            buttongen(text: text, id: x)
            
            
        }
       
        
        
    }
    func case3() {
        isTrueFalse(Boolean: false)
        isTextBox(istrue: false)
        isCheckBox(Boolean: true)
        
        qtext.text = workingdata.qlist[step]
        
        let qray = workingdata.checkBoxQuestions[step]
        qtext.text = workingdata.qlist[step]
        for x in 0...qray.count-1 {
            let text = workingdata.checkBoxQuestions[step][x]
            buttongen(text: text, id: x)
            
        }
        
        
        
        
        
    }
    func case4() {
        isTrueFalse(Boolean: false)
        isTextBox(istrue: false)
        isCheckBox(Boolean: true)
        
        qtext.text = workingdata.qlist[step]
        
        
        let questions = workingdata.checkBoxQuestions[step]
        for x in 0...questions.count-1 {
            let text = workingdata.checkBoxQuestions[step][x]
            buttongen(text: text, id: x)
        }
        otherbuttongen(text: "Other", id: activecbx.count)
        
        
        
    }
    func case5() {
        let db = DB()
        let alert = UIAlertAction(title: "Complete!", style: .default, handler: {_ in self.go()})
        let action = UIAlertController(title: "Continue", message: "Your form is finished and submitted!", preferredStyle: .alert)
        qtext.text = workingdata.qlist[step]
        complete = true
        db.finishform()
        action.addAction(alert)
        print("completing form")
        db.geteq()
        isTrueFalse(Boolean: false)
        isTextBox(istrue: false)
        isCheckBox(Boolean: false)
        
        self.present(action, animated: true, completion: {})
        
        
        
    }
    
    func go() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "formdone"), object: nil)
        let db = DB()
        self.dismiss(animated: true, completion: {})
        db.setchanged(answer: true)
        db.setstep(answer: 1)
        
    }
    
    
    // programaticly creates a button
    func buttongen(text: String, id: Int) {
        let buttwidth = 10
        let buttheight = 60
        let tboxwidth = 10
        let tboxheight = 30
        let rect = CGRect(x: 20, y: 150, width: 150, height: self.stackheight)
        let rightrec = CGRect(x: 220, y: 150, width: 150, height: self.rightstackheight)
        
        let tbox = UILabel()
        let butt = checkbox()
       
        
        butt.frame = CGRect(x: 0, y: 0, width: buttwidth, height: buttheight)
        butt.setImage(UIImage.init(named: "unticked"), for: .normal)
        butt.addTarget(self, action: #selector(click), for: .touchUpInside)
        butt.tag = id
        butt.setTitle("", for: .normal)
        
        
        
        tbox.frame = CGRect(x: 0, y: 0, width: tboxwidth, height: tboxheight)
        tbox.text = text
        tbox.textColor = .purple
        tbox.tag = id
        
        
      
        var stackView   = UIStackView()
        stackView = UIStackView(arrangedSubviews: [butt, tbox])
        stackView.alignment = .trailing
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 3.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        tlabel.append(tbox)
        activebut.append(stackView)
        activecbx.append(butt)
        
        if activebut.count <= 25 {
            switch sidetoadd {
            case true:
                self.stackheight += buttheight
                genstack.frame = rect
                genstack.addArrangedSubview(stackView)
                self.sidetoadd = false
            default:
                self.rightstackheight += buttheight
                rightgenstack.frame = rightrec
                rightgenstack.addArrangedSubview(stackView)
                self.sidetoadd = true
            }
       
            
        }
       
    }
    
    func otherbuttongen(text: String, id: Int) {
        let buttheight = 60
        let leftrec = CGRect(x: 20, y: 150, width: 150, height: self.stackheight)
        let genrect = CGRect(x: 220, y: 150, width: 180, height: self.rightstackheight)
        let tbox = UITextField()
        let butt = checkbox()
       
        
        tbox.returnKeyType = .done
        butt.frame = CGRect(x: 0, y: 0, width: 10, height: 60)
        butt.setImage(UIImage.init(named: "unticked"), for: .normal)
        butt.addTarget(self, action: #selector(otherclick), for: .touchUpInside)
        butt.tag = id
        butt.isother = true
        
        
        tbox.frame = CGRect(x: 0, y: 0, width: 10, height: 30)
        tbox.text = text
        tbox.textColor = .black
        tbox.tag = id
        
      
        var stackView   = UIStackView()
           stackView = UIStackView(arrangedSubviews: [butt, tbox])
       
        stackView.alignment = .trailing
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 3.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        activebut.append(stackView)
        activecbx.append(butt)
        tboxpool.append(tbox)
        
        
        
        if activebut.count <= 25 {
            switch sidetoadd {
            case true:
                self.stackheight += buttheight
                genstack.frame = leftrec
                genstack.addArrangedSubview(stackView)
                self.sidetoadd = false
            default:
                self.rightstackheight += buttheight
                rightgenstack.frame = genrect
                rightgenstack.addArrangedSubview(stackView)
                self.sidetoadd = true
            }
       
            
        }
        
    }
    
   
    
    
    @IBAction func debugpush(_ sender: Any) {
        arrange()
        
        
        
    }

    
    
    @objc func testfunc(sender: checkbox) {
        var jack = String(sender.title(for: .normal)!)
        let pic = UIImage.init(named: "ticked")
        let opic = UIImage.init(named: "unticked")
        switch sender.checked {
        case true:
            sender.setImage(opic, for: .normal)
            sender.checked = false
            
            
           
        default:
            sender.setImage(pic, for: .normal)
            sender.checked = true
        }
        
        
        for x in 0...1{
            print(x)
            jack.remove(at: jack.startIndex)
        }
        
        
        
        
    }
    
    
    
    
    func saveanswer() {
        if step == workingdata.qlist.count-1 {
            print("DONE!")
        }
        else{
        switch self.qtype[step] {
        case workingdata.questiontypes.trueFalse:
            answer.add(givenanswer)
            reload()
           
        case workingdata.questiontypes.textBox:
            if textbox.text?.isEmpty == true {
                print("answer not given")
                
            }
            else{
                answer.add(textbox.text!)
                reload()
            }
            
            
        case workingdata.questiontypes.checkBox:
            var answerlist = [String]()
            for x in activecbx{
                if x.checked == true{
                    for y in tlabel{
                        if x.tag == y.tag {
                            answerlist.append(y.text!)
                        }
                    }
                }
            
            }
            if answerlist.count != 1 {
                print("ERROR")
                
            }
            if answerlist.count == 1{
                answer.add(answerlist[0])
                reload()
            }
            
            
        case workingdata.questiontypes.checkBoxmulti:
            view.sendSubviewToBack(yesnocontainer)
            var answerlist = [String]()
            for x in activecbx{
                if x.checked == true{
                    for y in tlabel{
                        if x.tag == y.tag {
                            answerlist.append(y.text ?? "Nil")
                        }
                    }
                }
            
            }
            if answerlist.count < 1 {
                print("Please select an answer")
            }
            else{
                answer.add(answerlist)
                reload()
            }
            
        case workingdata.questiontypes.checkBoxOther:
            view.sendSubviewToBack(yesnocontainer)
            var answerlist = [String]()
            for x in activecbx{
                if x.checked == true{
                    switch x.isother {
                    case false:
                        for y in tlabel{
                            if x.tag == y.tag {
                                answerlist.append(y.text ?? "Nil")
                            }
                            
                        }
                    default:
                        for y in tboxpool{
                            if x.tag == y.tag{
                                answerlist.append(y.text ?? "NIL")
                            }
                        }
                    }
                    
                    
                    
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
            print("somthings wrong with your cannnnoini'nnises man")
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
    }
    
    @IBAction func submit(_ sender: Any) {
        saveanswer()
        if complete == true {
            workingdata.alist = answer
            performSegue(withIdentifier: "done", sender: Any?.self)
        }
        
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
        var img = UIImage(systemName: "hand.thumbsdown.fill")
        no.setImage(UIImage(systemName: "hand.thumbsdown.fill"), for: .normal)
        var timea = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: false, block: {_ in self.no.setImage(UIImage(systemName: "hand.thumbsdown"), for: .normal)
            timea.invalidate()
        })
        
        givenanswer = false
       
     
      saveanswer()
        
        
    }
    
    @IBAction func yespush(_ sender: Any) {
        var img = UIImage(systemName: "hand.thumbsup.fill")
        
        yes.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
        var timea = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: false, block: {_ in self.yes.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            timea.invalidate()
        })
        givenanswer = true
        saveanswer()
        
    }
    @objc func click(sender: checkbox) {
        
        let pic = UIImage.init(named: "ticked")
        let opic = UIImage.init(named: "unticked")
        switch sender.checked {
        case true:
            sender.setImage(opic, for: .normal)
            sender.checked = false
            
        default:
            sender.setImage(pic, for: .normal)
            sender.checked = true
            
            
        }
        
        // How to get data from the tapped button
        let clickedid = sender.tag
        if sender.checked == true {
        for x in tlabel {
            if x.tag == clickedid{
                print("button clicked was " + x.text!)
                
            }
           
          }
        }
    }
    
    @objc func otherclick(sender: checkbox) {
        
        let pic = UIImage.init(named: "ticked")
        let opic = UIImage.init(named: "unticked")
        switch sender.checked {
        case true:
            sender.setImage(opic, for: .normal)
            sender.checked = false
            

        default:
            sender.setImage(pic, for: .normal)
            sender.checked = true
            
        }
        
        // How to get data from the tapped button
        let clickedid = sender.tag
        if sender.checked == true {
        for x in tboxpool {
            if x.tag == clickedid{
                print("button clicked was " + x.text!)
                
            }
           
          }
        }
    }
    
}





