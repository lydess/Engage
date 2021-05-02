//
//  courseviewcontroller.swift
//  Engage
//
//  Created by william Vise on 22/4/21.
//

import Foundation
import Foundation
import UIKit
import SceneKit


class courseviewcontroller: UIViewController {
    @IBOutlet weak var bubble: UIStackView!
    @IBOutlet weak var debug: UIButton!
    @IBOutlet weak var vertstack: UIStackView!
    @IBOutlet weak var avo: UIButton!
    
    @IBOutlet weak var debug2: UIButton!
    @IBOutlet weak var buttonstack: UIStackView!
    @IBOutlet weak var trades: UIButton!
    @IBOutlet weak var scrollview: UIScrollView!
    
    var userview = 0
    var buttonheight = CGFloat(120)
    var buttonwidth = CGFloat(250)
    var stackspacing = 20
    var dynamicstack = UIStackView()
    var buttonid = 1
    
    var activebut = [UIButton]()
    var clr = [.red, UIColor.yellow, UIColor.green,UIColor.blue, UIColor.cyan]
    
    var mainmenu = ["Technical trade","Health and community","Land and animals","Business and Technology","Short courses"]
    var techtxt = ["Electrotechnology","Plumbing","Airconditioning","Automotive"]
    var healthtxt = ["Community services","Disability","Nursing","Education"]
    var landtxt = ["Dog grooming", "Animals studies", "Agriculture"]
    var technology = ["IT and cyber security", "Buisness", "HR and leadership"]
    var sctxt = ["White card","RSA","Chainsaw operators","chemical users"]
    
    
    override func viewDidLoad() {
        //bubble.isLayoutMarginsRelativeArrangement = true
        //bubble.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 30)
        
        dynamicstack.frame = CGRect(x: 0, y: 0, width: buttonwidth, height: buttonheight)
        //dynamicstack.backgroundColor = .yellow
        dynamicstack.distribution = .fillEqually
        dynamicstack.spacing = CGFloat(stackspacing)
        dynamicstack.axis = .vertical
        bubble.addSubview(dynamicstack)
        setuserview()
        debug.contentMode = .scaleToFill
        
       
    
        
    }
    
    func setuserview() {
        switch workingdata.courseview {
        case 0:
            for x in 0...mainmenu.count-1 {
                addbut(text: self.mainmenu[x],color: clr[x])
            }
        case 1:
            for x in 0...techtxt.count-1 {
                addbut(text: techtxt[x], color: clr[x])
            }
        case 2:
            for x in 0...healthtxt.count-1 {
                addbut(text: healthtxt[x], color: clr[x])
            }
        case 3:
            for x in 0...landtxt.count-1 {
                addbut(text: landtxt[x], color: clr[x])
            }
        case 4:
            for x in 0...technology.count-1 {
                addbut(text: technology[x], color: clr[x])
            }
        case 5:
            for x in 0...sctxt.count-1 {
                addbut(text: sctxt[x], color: clr[x])
            }
        default:
            print("somthings wrong with cases")
        }
    }
    
    func viewchange() {
        activebut.removeAll()
        for x in dynamicstack.subviews{
            x.removeFromSuperview()
        }
        
        dynamicstack.frame = CGRect(x: 0, y: 0, width: buttonwidth, height: buttonheight)
        buttonid = 1
        
        
        setuserview()
        print("view changed")
    }
    
    
    func loadscroll() {
        
    
        
        }
    
    func addbut(text: String, color: UIColor) {
        
        let button = UIButton()

        button.frame = CGRect(x: 0, y: 0, width: buttonwidth, height: self.buttonheight-10)
        button.backgroundColor = color
        button.layer.cornerRadius = 40
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = buttonid
        buttonid += 1
        
        activebut.append(button)
        
        addrow()
        dynamicstack.addArrangedSubview(button)
        
       // Creates a UI button and sets it up as part of the scrollview stack
        
        
        
    }
    func addrow() {
        
        dynamicstack.frame = CGRect(x: 0, y: 0, width: dynamicstack.frame.width, height: dynamicstack.frame.height + buttonheight + CGFloat(stackspacing))
        
        
    }
    
    @objc func click(sender: UIButton){
        print("current button id is " + String(buttonid))
        var answer = "The button you clicked was "
        if workingdata.courseview == 0{
        workingdata.courseview = sender.tag
        switch workingdata.courseview {
        case 1:
            print("current view is technical trades")
            userview = 1
            viewchange()
        case 2:
            print("current view is Health and Community")
            userview = 2
            viewchange()
        case 3:
            print("current view is land and animals")
            userview = 3
            viewchange()
        case 4:
            print("current view is technology")
            userview = 4
            viewchange()
        case 5:
            print("current view is shortcourses")
            userview = 5
            viewchange()
        default:
            print("somthings wrong with the cases")
            viewchange()
            
        }
        
        
        }
        else
        {
            print(answer + sender.titleLabel!.text!)
            workingdata.selectedcourse = sender.titleLabel!.text!
            performSegue(withIdentifier: "courseinfo", sender: Any?.self)
        }
        
    }
    
    @IBAction func topdebugpush(_ sender: Any) {
        if workingdata.courseview != 0 {
            
        
        workingdata.courseview = 0
        userview = 0
        viewchange()
        print("going home")
        }
        else {performSegue(withIdentifier: "home", sender: Any?.self)}
        
    }
    @IBAction func bottomdebugpush(_ sender: Any) {
        for x in activebut{
            print(x.tag)
        }
        
    }
        
    
    }
    
    
    
    
    

