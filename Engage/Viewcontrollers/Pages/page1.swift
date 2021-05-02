//
//  page1.swift
//  Engage
//
//  Created by william Vise on 1/5/21.
//

import Foundation
import UIKit

class page1: UIViewController {
   
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
    }
    func makevc() {
        let vc = UIPageViewController()
        
        vc.setViewControllers([], direction: .forward, animated: true, completion: nil)
    }
    
}
