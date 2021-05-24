//
//  courseinfocontroller.swift
//  Engage
//
//  Created by william Vise on 29/4/21.
//

import Foundation
import  UIKit

class courseinfoviewcontroller: UIViewController {
    @IBOutlet weak var topbar: UIImageView!

    
    @IBOutlet weak var costsbutton: UIButton!
    @IBOutlet weak var Coursetitle: UILabel!
    @IBOutlet weak var courseblurb: UITextView!

    @IBOutlet weak var cviewbox: UIView!
   
    var clr = colors()
    var clrlist = [UIColor]()
    override func viewDidLoad() {
        super.viewDidLoad()

        initalize()
        
    }
    
    func initalize() {
        var course = workingdata.currentCourseView

        Coursetitle.text = workingdata.selectedCourse
        clrlist = clr.colorlist()
        
        costsbutton.layer.cornerRadius = 20
        courseblurb.layer.cornerRadius = 20
       
        switch workingdata.currentCourseView {
        case .technicalTrades:
            topbar.backgroundColor = clrlist[1]
        case .healthAndCommunity:
            topbar.backgroundColor = clrlist[2]
        case .landAndAnimals:
            topbar.backgroundColor = clrlist[3]
        case .businessAndTechnology:
            topbar.backgroundColor = clrlist[4]
        case .shortCourses:
            topbar.backgroundColor = clrlist[5]
        
        default:
            topbar.backgroundColor = .darkGray
        }
        
    }
    @IBAction func costspush(_ sender: Any) {
        
        
    }
    
    
       
        
        
        
        
        
    }
    

