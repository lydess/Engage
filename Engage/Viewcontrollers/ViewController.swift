//
//  ViewController.swift
//  Engage
//
//  Created by william Vise on 1/4/21.
//

import UIKit
import SceneKit


class ViewController: UIViewController {
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var debugbutton: UIButton!
    @IBOutlet weak var Formfillerbutton: UIButton!
    @IBOutlet weak var debug: UIButton!
    
    @IBOutlet var gesture: UIPanGestureRecognizer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(workingdata.doc)
        print()
        
        
        
        
    }
   

    @IBAction func debugpush(_ sender: Any) {
        
        
     
    }
    
    
    
    @IBAction func debugbu(_ sender: Any) {
        //SCNTransaction.animationDuration = 30
        
        
        
        
    }
    
    
    @IBAction func handlePan(_ gesture: UIPanGestureRecognizer) {
      // 1
      let translation = gesture.translation(in: view)

      // 2
      guard let gestureView = gesture.view else {
        return
      }

      gestureView.center = CGPoint(
        x: gestureView.center.x + translation.x,
        y: gestureView.center.y + translation.y
      )

      // 3
      gesture.setTranslation(.zero, in: view)
    }
}

