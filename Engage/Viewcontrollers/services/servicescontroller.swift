//
//  servicescontroller.swift
//  Engage
//
//  Created by william Vise on 17/5/21.
//

import Foundation
import UIKit

class servicescontroller: UIViewController {
    @IBOutlet weak var Careers: UIButton!
    @IBOutlet weak var support: UIButton!
    @IBOutlet weak var Services: UIButton!
    @IBOutlet weak var homebutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initalise()
    }
    func initalise()  {
        Careers.contentVerticalAlignment = .fill
        Careers.contentHorizontalAlignment = .fill
        support.contentVerticalAlignment = .fill
        support.contentHorizontalAlignment = .fill
        Services.contentHorizontalAlignment = .fill
        Services.contentVerticalAlignment = .fill
        
        
        Careers.backgroundColor = .clear
        support.backgroundColor = .clear
        Services.backgroundColor = .clear
    }
    
    
    @IBAction func Carreersdown(_ sender: Any) {
    }
    @IBAction func supportdown(_ sender: Any) {
    }
    @IBAction func servicesdown(_ sender: Any) {
    }
    @IBAction func homedown(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }
}
