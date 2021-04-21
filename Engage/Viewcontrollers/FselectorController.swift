//
//  FselectorController.swift
//  Engage
//
//  Created by william Vise on 2/4/21.
//

import Foundation
import UIKit

class FselectorController: UIViewController {
    @IBOutlet weak var eqb: UIButton!
    @IBOutlet weak var ibutton: UIImageView!
    var data = workingdata()
    let alert = UIAlertController(title: "Already working on a form", message: "Select again to delete your current form", preferredStyle: .alert)
    let action = UIAlertAction(title: "Error", style: .destructive, handler: {_ in workingdata.wipeout()
        
    })
// Todo, include additional hard coded documents
    
    @IBOutlet weak var debug: UIButton!
    @IBOutlet weak var homebutton: UIButton!
    @IBOutlet weak var FSAbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        eqb.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        print(workingdata.doc)
        alert.addAction(action)
        if workingdata.alreadyworking == true{
            ibutton.image = UIImage(imageLiteralResourceName: "ticked")
        }
        
    }

    @IBAction func FSApush(_ sender: Any) {
        switch workingdata.alreadyworking {
        case true:
            print("WARNING")
            self.present(alert, animated: true, completion: nil)
        default:
            print("NOT WARNING")
            data.templateset(templateid: 0)
            print(workingdata.templatename)
            workingdata.alreadyworking = true
            
            
        }
        
        
        //data.templateset(templateid: 0)
        //print(workingdata.templatename)
    }
    
    @IBAction func homepush(_ sender: Any) {
        
    }
    func testname() {
        print("hello world")
        
    }
}

