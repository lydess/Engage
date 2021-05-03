//
//  uitests.swift
//  Engage
//
//  Created by william Vise on 3/5/21.
//

import Foundation
import UIKit

class uitestcontroller: UIViewController {
    
    
    @IBOutlet var viewbox: UIView!
    @IBOutlet weak var debug: UIButton!
    let testview = UIView(frame: CGRect(x: -100, y: 0, width: 100, height: 896))
    
    override func viewDidLoad() {
        
        
        
        
    }
    
    
    @objc func click(sender: UIButton) {
        var jack = testview.subviews[3].description
    }
    @IBAction func debugpush(_ sender: Any) {
        
       
        
        
       
        self.view.frame = CGRect(x: 100, y: 0, width: 414, height: 896)
        testview.backgroundColor = .red
        self.view.addSubview(testview)
        
    }
    
    @IBAction func buttonmaker(_ sender: Any) {
        let button = UIButton(frame: CGRect(x: 0, y: 150, width: 50, height: 50))
        button.backgroundColor = .yellow
        button.setTitleColor(.black, for: .normal)
        button.setTitle("click", for: .normal)
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
        testview.addSubview(button)
        
    }
}
