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
    @IBOutlet weak var debug: UIButton!
    
    @IBOutlet weak var Coursetitle: UILabel!
    @IBOutlet weak var courseblurb: UITextView!
    @IBOutlet weak var costsbackground: UIImageView!
    @IBOutlet weak var fullfeeint: UILabel!
    @IBOutlet weak var fullfeelabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("welcome to course info")
        initalize()
    }
    
    func initalize() {
        Coursetitle.text = workingdata.selectedcourse
        topbar.layer.shadowOffset = .init(width: 500, height: 500)
        //fullfeelabel.shadowColor = .black
        //fullfeelabel.toggleBoldface(Any?.self)
        //fullfeelabel.shadowOffset = CGSize(width: 1, height: 1)
        
        costsbackground.layer.cornerRadius = 20
        courseblurb.layer.cornerRadius = 20
        switch workingdata.courseview {
        case 0:
            topbar.backgroundColor = .red
        case 1:
            topbar.backgroundColor = .yellow
        case 2:
            topbar.backgroundColor = .blue
        case 3:
            topbar.backgroundColor = .green
        case 4:
            topbar.backgroundColor = .brown
        
        default:
            topbar.backgroundColor = .darkGray
        }
        
    }
    @IBAction func debugpush(_ sender: Any) {
        print(workingdata.courseview)
    }
}
