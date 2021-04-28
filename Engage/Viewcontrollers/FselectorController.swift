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
    @IBOutlet weak var buttonbackground: UIImageView!
    var data = workingdata()
    let alert = UIAlertController(title: "Already working on a form", message: "Select again to delete your current form", preferredStyle: .alert)
    let action = UIAlertAction(title: "Error", style: .destructive, handler: {_ in workingdata.wipeout()

    })
    
    
// Todo, include additional hard coded documents
    
    @IBOutlet weak var homebutton: UIButton!
    @IBOutlet weak var progbar: UIProgressView!
    @IBOutlet weak var debug: UIButton!
    @IBOutlet weak var textout: UILabel!
    @IBOutlet weak var FSAbutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        progbar.progress = 0.1
        let more = UIAlertAction(title: "continue", style: .default, handler: {_ in self.goback() })
        eqb.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
        print(workingdata.doc)
        alert.addAction(action)
        alert.addAction(more)
        if workingdata.alreadyworking == true{
            
            var timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(anim), userInfo: nil, repeats: true)
            
        }
       
    }
    @objc func anim() {
        ibutton.image = UIImage(imageLiteralResourceName: "ticked")
        UIView.animate(withDuration: 0.5, animations: {
            self.textout.text = "thanks for your form!, one of your enquiry officers will give you a call soon!"
        })
        UIView.animate(withDuration: 0.55, animations: {self.progbar.setProgress(0.25, animated: true)})
        UIView.animate(withDuration: 0.75, animations: {
            self.FSAbutton.backgroundColor = .gray
        })
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
    func goback() {
      print("gettign hold///")
            performSegue(withIdentifier: "return", sender: Any?.self)
        
    }
    
}

