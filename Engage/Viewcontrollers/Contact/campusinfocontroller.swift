//
//  campusinfocontroller.swift
//  Engage
//
//  Created by william Vise on 11/5/21.
//

import Foundation
import UIKit

class campusinfocontroller: UIViewController {
    
    @IBOutlet weak var toplabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        uibuild()
    }
    func uibuild() {
        switch workingdata.selectedcampus {
        case 0:
            toplabel.text = "Fryers st"
        default:
            print("cases be borked")
        }
    }
}
