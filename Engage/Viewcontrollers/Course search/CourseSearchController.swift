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


class CourseSearchController: UIViewController {
    @IBOutlet weak var bubble: UIStackView!
    @IBOutlet weak var debug: UIButton!
    @IBOutlet weak var homelabel: UILabel!

    var color = colors()
  
    var buttonheight = CGFloat(80)
    var buttonwidth = CGFloat(250)
    var stackspacing = 20
    var dynamicstack = UIStackView()
    var buttonid = 1
    var font = UIFont(name: "Poppins Bold", size: 17)
    
    
    var activebut = [UIButton]()
    var clr = [UIColor]()
    
    var mainmenu = ["Technical trade","Health and community","Land and animals","Business and Technology","Short courses"]
    var techtxt = ["Electrotechnology","Plumbing","Airconditioning","Automotive"]
    var healthtxt = ["Community services","Disability","Nursing","Education"]
    var landtxt = ["Dog grooming", "Animals studies", "Agriculture"]
    var technology = ["IT and cyber security", "Buisness", "HR and leadership"]
    var sctxt = ["White card","RSA","Chainsaw operators","chemical users"]
    
    
    override func viewDidLoad() {
       initalize()

        
        
         
        
       
    
        
    }
    
    func initalize() {
        clr = color.colorlist()
        dynamicstack.frame = CGRect(x: 0, y: 0, width: buttonwidth, height: buttonheight)
        dynamicstack.distribution = .fillEqually
        dynamicstack.spacing = CGFloat(stackspacing)
        dynamicstack.axis = .vertical
        bubble.addSubview(dynamicstack)
        setuserview()
        debug.contentVerticalAlignment = .fill
        debug.contentHorizontalAlignment = .fill
    }
    
    func setuserview() {
        switch workingdata.currentCourseView {
        case .mainMenu:
            for x in 0...mainmenu.count-1 {
                generateButton(text: self.mainmenu[x],color: clr[x])
            }
        case .technicalTrades:
            for x in 0...techtxt.count-1 {
                generateButton(text: techtxt[x], color: clr[0])
            }
        case .healthAndCommunity:
            for x in 0...healthtxt.count-1 {
                generateButton(text: healthtxt[x], color: clr[1])
            }
        case .landAndAnimals:
            for x in 0...landtxt.count-1 {
                generateButton(text: landtxt[x], color: clr[2])
            }
        case .businessAndTechnology:
            for x in 0...technology.count-1 {
                generateButton(text: technology[x], color: clr[3])
            }
        case .shortCourses:
            for x in 0...sctxt.count-1 {
                generateButton(text: sctxt[x], color: clr[4])
            }
        
        }
    }
    
    func Resetview() {
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
    
    func generateButton(text: String, color: UIColor) {
        
        let button = UIButton()

        button.frame = CGRect(x: 0, y: 0, width: buttonwidth, height: self.buttonheight-10)
        button.backgroundColor = color
        button.layer.cornerRadius = 40
        button.titleLabel?.font = font
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = activebut.count

        
        
        
        
        activebut.append(button)
        Addstackheight()
        dynamicstack.addArrangedSubview(button)
        
       // Creates a UI button and sets it up as part of the scrollview stack
        
        
        
    }
    func Addstackheight() {
        
        dynamicstack.frame = CGRect(x: 0, y: 0, width: dynamicstack.frame.width, height: dynamicstack.frame.height + buttonheight + CGFloat(stackspacing))
        
        
    }
    
    func setButtonLink(butt: UIButton) -> workingdata.coursetypes {
        var answer = workingdata.coursetypes.mainMenu
        switch butt.tag {
        case 0:
            answer = .technicalTrades
        case 1:
            answer = .healthAndCommunity
        case 2:
            answer = .landAndAnimals
        case 3:
            answer = .businessAndTechnology
        case 4:
            answer = .shortCourses
        default:
            print("cases failed")
            
        }
        return answer
        
    }
    
    @objc func click(sender: UIButton){
        homelabel.text = "Back"
        
        if workingdata.currentCourseView == .mainMenu{
        workingdata.currentCourseView = setButtonLink(butt: sender)
        Resetview()
            
        } else {
    
            workingdata.selectedCourse = sender.titleLabel!.text!
            performSegue(withIdentifier: "courseinfo", sender: Any?.self)
        }
        
    }
    
    @IBAction func Backbutton(_ sender: Any) {
        if workingdata.currentCourseView != .mainMenu {
            
        workingdata.currentCourseView = .mainMenu
        //userview = 0
        Resetview()
        homelabel.text = "Home"
        
        }
        else {performSegue(withIdentifier: "home", sender: Any?.self)}
        
    }
    @IBAction func bottomdebugpush(_ sender: Any) {
        for x in activebut{
            print(x.tag)
        }
        
    }
        
    
    }
    
    
    
    
    

