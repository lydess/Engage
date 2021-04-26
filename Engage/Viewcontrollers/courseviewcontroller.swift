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
    @IBOutlet weak var bubble: bubbleview!
    @IBOutlet weak var debug: UIButton!
    @IBOutlet weak var vertstack: UIStackView!
    @IBOutlet weak var avo: UIButton!
    
    @IBOutlet weak var debug2: UIButton!
    @IBOutlet weak var buttonstack: UIStackView!
    @IBOutlet weak var trades: UIButton!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        
       
        
    
        
    }
    
    func loadscroll() {
        var clr = [UIColor.red, UIColor.yellow, UIColor.green,UIColor.blue, UIColor.cyan]
        var txt = ["Technical trade","Health and community","Land and animals","Technology","Short courses"]
    
        var buttonlist = buttonstack.arrangedSubviews
        
        for x in 0...buttonlist.count-1 {
            buttonlist[x].layer.cornerRadius = 30
            buttonlist[x].backgroundColor = clr[x]
        }
    }
    
    func addbut() {
        var button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 254, height: 99)
        button.backgroundColor = .red
        
        
        buttonstack.addArrangedSubview(button)
        button.addConstraint(NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: trades, attribute: .height, multiplier: 1.0, constant: 0))
        
    }
    
    @IBAction func debug(_ sender: Any) {
        loadscroll()
    }
    
    @IBAction func debug2(_ sender: Any) {
        addbut()
    }
}
