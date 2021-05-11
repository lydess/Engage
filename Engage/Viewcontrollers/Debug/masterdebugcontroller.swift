//
//  masterdebugcontroller.swift
//  Engage
//
//  Created by william Vise on 3/5/21.
//

import Foundation
import UIKit


class masterdebugcontroller: UIViewController {
   
    @IBOutlet var tap: UITapGestureRecognizer!
    @IBOutlet weak var modalswitch: UISwitch!
    var pdf = pdfdirector()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let warning = UIAlertController(title: "WARNING!", message: "This is the developer menu, dont screw with this unless you're Will", preferredStyle: .alert)
        
        let alert = UIAlertAction(title: "Understood", style: .destructive, handler: {_ in })
        warning.addAction(alert)
        self.present(warning, animated: true, completion: {})
    }
    @IBAction func test(_ sender: Any) {
        
    }
    @IBAction func UIpush(_ sender: Any) {
        switch modalswitch.isOn {
        case true:
            performSegue(withIdentifier: "debugmodal", sender: Any?.self)
        default:
            performSegue(withIdentifier: "debugfullscreen", sender: Any?.self)
        }
    }
    @IBAction func tapdown(_ sender: Any) {
        print("hello world")
    }
    @IBAction func pdfdown(_ sender: Any) {
        pdf.main()
    }
}
