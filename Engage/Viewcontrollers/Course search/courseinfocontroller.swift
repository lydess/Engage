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
        print("welcome to course info")
        initalize()
        
    }
    
    func initalize() {
        
        Coursetitle.text = workingdata.selectedcourse
        //topbar.layer.shadowOffset = .init(width: 500, height: 500)
        //fullfeelabel.shadowColor = .black
        //fullfeelabel.toggleBoldface(Any?.self)
        //fullfeelabel.shadowOffset = CGSize(width: 1, height: 1)
        clrlist = clr.colorlist()
        var course = workingdata.courseview
        costsbutton.layer.cornerRadius = 20
        courseblurb.layer.cornerRadius = 20
        //topbar.layer.cornerRadius = 20
        switch workingdata.courseview {
        case 0:
            topbar.backgroundColor = clrlist[1]
        case 1:
            topbar.backgroundColor = clrlist[course]
        case 2:
            topbar.backgroundColor = clrlist[course]
        case 3:
            topbar.backgroundColor = clrlist[course]
        case 4:
            topbar.backgroundColor = clrlist[course]
        
        default:
            topbar.backgroundColor = .darkGray
        }
        
    }
    @IBAction func costspush(_ sender: Any) {
        
        
    }
    
    
       
        
        
        
        
        
    }
    

