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
    @IBOutlet weak var qtext: UILabel!
    @IBOutlet weak var debug: UIButton!
    @IBOutlet var pan: UIPanGestureRecognizer!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var yesnocontainer: UIStackView!
    
    
    
    
    @IBOutlet var tapges: UITapGestureRecognizer!

    var data = workingdata()
    var cords = CGRect.init(x: 100, y: 100, width: 50, height: 50)
    var queue = [String]()
    var answer = NSMutableArray()
    var qtype = [Int]()
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
    func functionName() {
        print("hello world")
    }
    func yesno(Boolean:Bool) {
        if Boolean == true {
            yes.reset()
            no.reset()
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
    @objc func slidedown() {
        workingdata.qlist = queue
        workingdata.qtype = qtype
        workingdata.resumedstep = step
        
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
            case4()
        case 5:
            case5()
        default:
            print("case 1")
        }
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
        
        qtext.text = workingdata.qlist[step]
        print("case 1")
        
    }
    func case2() {
        yesno(Boolean: false)
        submit(istrue: false)
        genstack.isHidden = false
        rightgenstack.isHidden = false
        qtext.text = workingdata.qlist[step]
        
        let qray = workingdata.qcbx[step]
        qtext.text = workingdata.qlist[step]
        for x in 0...qray.count-1 {
            let text = workingdata.qcbx[step][x]
            buttongen(text: text, id: x)
            
            
        }
       
        print("case 2")
        
    }
    func case3() {
        yesno(Boolean: false)
        submit(istrue: false)
        genstack.isHidden = false
        genstack.alpha = 1
        rightgenstack.isHidden = false
        rightgenstack.alpha = 1
        qtext.text = workingdata.qlist[step]
        print(step)
        let qray = workingdata.qcbx[step]
        qtext.text = workingdata.qlist[step]
        for x in 0...qray.count-1 {
            let text = workingdata.qcbx[step][x]
            buttongen(text: text, id: x)
            
        }
        
        
        
        
        
    }
    func case4() {
        yesno(Boolean: false)
        submit(istrue: false)
        genstack.isHidden = false
        genstack.alpha = 1
        qtext.text = workingdata.qlist[step]
        print(step)
        let questions = workingdata.qcbx[step]
        for x in 0...questions.count-1 {
            let text = workingdata.qcbx[step][x]
            buttongen(text: text, id: x)
        }
        otherbuttongen(text: "Other", id: activecbx.count)
        
        
        
    }
    func case5() {
        var db = DB()
        qtext.text = workingdata.qlist[step]
        complete = true
        db.finishform()
        
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
    
    @IBAction func pandown(_ sender: Any) {
        print("pan recognized")
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
    
    
    @IBAction func pan(_ sender: Any) {
        let jacks = pan.translation(in: view)
        print(jacks)
    }
    
    func saveanswer() {
        if step == workingdata.qlist.count-1 {
            print("DONE!")
        }
        else{
        switch self.qtype[step] {
        case 0:
            if yes.checked == true && no.checked == true {
                print("WRONG!")
        
            }
            if yes.checked == false && no.checked == false {
                print("NO ANSWER")
            }
            
            if no.checked == true && yes.checked == false{
                answer.add(0)
                reload()
            }
            if no.checked == false && yes.checked == true {
                answer.add(1)
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
            
            
        case 3:
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
            
        case 4:
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
    }
    // controls the swipe right to save answer functionality ONLY SAVE DATA TO THE ANSWERLIST FROM HERE
    @IBAction func rightswipe(_ sender: Any) {
        
        
    
    
    }
   
    @IBAction func submit(_ sender: Any) {
        saveanswer()
        if complete == true {
            workingdata.alist = answer
            performSegue(withIdentifier: "done", sender: Any?.self)
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



