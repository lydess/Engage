//
//  costscontroller.swift
//  Engage
//
//  Created by william Vise on 17/5/21.
//

import Foundation
import UIKit

class CostsController: UIViewController {
    @IBOutlet weak var contentview: UIView!
    
    @IBOutlet weak var leftcheck: UIImageView!
    @IBOutlet weak var rightcheck: UIImageView!
    @IBOutlet weak var learn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initalize()
        
    }
    
    func initalize() {
        
        contentview.layer.cornerRadius = 20
        rightcheck.contentMode = .scaleToFill
        leftcheck.contentMode = .scaleToFill
        learn.titleLabel?.numberOfLines = 5
        learn.backgroundColor = .blue
       
        learn.layer.cornerRadius = 5
    }
    
    @IBAction func swipedown(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }
    

}


