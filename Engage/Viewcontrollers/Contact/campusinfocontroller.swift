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
        getcampus()
        uibuild()
    }
    func getcampus() {
       
        switch workingdata.selectedcampus {
        case 0:
            workingdata.campusobject = campus(name: "Fryers st",
                                              address: "152/200 Fryers st Shepparton Victoria 3630"
                                              
            
            
            
            
            )
        default:
        print("failure")
        }
    }
    func uibuild() {
        var data = workingdata.campusobject
        toplabel.text = data.Name
        
    }
}
