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
    
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        
        
        
    }
    
    func loadscroll() {
       
    }
    
    @IBAction func debug(_ sender: Any) {
        var stack = bubble.makebubble(inview: vertstack)
        
        print("made a bubble")
        vertstack.addArrangedSubview(stack)
        print(bubble.subviews)
    }
}
