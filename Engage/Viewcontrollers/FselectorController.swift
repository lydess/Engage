//
//  FselectorController.swift
//  Engage
//
//  Created by william Vise on 2/4/21.
//

import Foundation
import UIKit

class FselectorController: UIViewController {
    var data = workingdata()
    @IBOutlet weak var homebutton: UIButton!
    @IBOutlet weak var FSAbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Fselector")
    }

    @IBAction func FSApush(_ sender: Any) {
    }
    
    @IBAction func homepush(_ sender: Any) {
    }
}

