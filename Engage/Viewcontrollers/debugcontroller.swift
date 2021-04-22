//
//  debugcontroller.swift
//  Engage
//
//  Created by william Vise on 17/4/21.
//

import Foundation


import UIKit
import SceneKit
import CoreHaptics

class debugcontroller: UIViewController {
    

    @IBOutlet weak var debug1: UIButton!
    @IBOutlet weak var Debug2: UIButton!
    @IBOutlet weak var debug3: UIButton!

    @IBOutlet weak var yesno: UIImageView!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet var pan: UIPanGestureRecognizer!
    @IBOutlet weak var barbut: UIBarButtonItem!
    @IBOutlet var swiperight: UISwipeGestureRecognizer!
    @IBOutlet weak var box: UILabel!
    
    
    var vibe: CHHapticEngine!
    
    
    
    override func viewDidLoad() {
        
        
        
        
    }
        func testfunc() {
           
        do{
            vibe = try CHHapticEngine()
        }
        catch let error { fatalError("engine creation error \(error)")
        
        }
            
        }
        
    
    @IBAction func debug1push(_ sender: Any) {
       
       testfunc()
    }
    @IBAction func debug2push(_ sender: Any) {
        let hapticDict = [
            CHHapticPattern.Key.pattern: [
                [CHHapticPattern.Key.event: [CHHapticPattern.Key.eventType: CHHapticEvent.EventType.hapticTransient,
                      CHHapticPattern.Key.time: 0.001,
                      CHHapticPattern.Key.eventDuration: 1.0] // End of first event
                ] // End of first dictionary entry in the array
            ] // End of array
        ] // End of haptic dictionary
        
    
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
   
    @IBAction func pandown(_ sender: Any) {
        var lastplace = box.center
        if pan.state == .began {
           var lastplace = box.center
            
            print(pan.translation(in: self.view))

        }
        if pan.state == .changed {
            var xchange = pan.translation(in: self.view).x
            var ychange = pan.translation(in: self.view).y
            
        }
        
        
    }
}
