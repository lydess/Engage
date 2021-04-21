//
//  debugcontroller.swift
//  Engage
//
//  Created by william Vise on 17/4/21.
//

import Foundation


import UIKit
import SceneKit


class debugcontroller: UIViewController {
    

    @IBOutlet weak var debug1: UIButton!
    @IBOutlet weak var Debug2: UIButton!
    @IBOutlet weak var debug3: UIButton!

    @IBOutlet weak var barbut: UIBarButtonItem!
    @IBOutlet var swiperight: UISwipeGestureRecognizer!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        
        
        
    }
    @objc func testfunc() {
        print("dacsd")
    }
    
    @IBAction func debug1push(_ sender: Any) {
       
        let vc = UIViewController()
        vc.modalPresentationStyle = .popover //or .overFullScreen for transparency
        let but = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 700))
        but.backgroundColor = .systemGray5
        but.addTarget(self, action: #selector(testfunc), for: .touchUpInside)
        vc.view.addSubview(but)
        
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func debug2push(_ sender: Any) {
        
       
       
        
    }
    
    @IBAction func barbutpush(_ sender: Any) {
        
        // Load and configure your view controller.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let optionsVC = storyboard.instantiateViewController(
                   withIdentifier: "itemOptionsViewController")
         
        // Use the popover presentation style for your view controller.
        optionsVC.modalPresentationStyle = .popover
        optionsVC.preferredContentSize = CGSize(width: 200, height: 200)
        optionsVC.view.frame = CGRect(x: 0, y: 0, width: 500, height: 500)

        // Specify the anchor point for the popover.
        optionsVC.popoverPresentationController?.barButtonItem =
                   barbut

        
        self.present(optionsVC, animated: true) {
           
        
        }
        
    }
    @IBAction func debug3push(_ sender: Any) {
        
        
        
        
        
    }
    @IBAction func swiperight(_ sender: Any) {
      
    
}
}
