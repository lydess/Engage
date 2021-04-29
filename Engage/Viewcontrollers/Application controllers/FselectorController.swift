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
    @IBOutlet weak var formlist: UIStackView!
    @IBOutlet weak var toptext: UILabel!
    @IBOutlet weak var debug: UIButton!
    @IBOutlet weak var FSAbutton: UIButton!
    
    var data = workingdata()
    let alert = UIAlertController(title: "Already working on a form", message: "Select again to delete your current form", preferredStyle: .alert)
    let action = UIAlertAction(title: "Error", style: .destructive, handler: {_ in workingdata.wipeout() })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var const = [NSLayoutConstraint]()
        let more = UIAlertAction(title: "continue", style: .default, handler: {_ in self.goback() })
        alert.addAction(action)
        alert.addAction(more)
        //const.append(formlist.widthAnchor.constraint(equalToConstant: 330))
        //NSLayoutConstraint.activate(const)
        
        toptext.text = ("Hello " + workingdata.userid + ", Here are the tasks we need you to complete")
       
    }

    func addbut(text: String) {
        let symbol = UIImage(systemName: "info.circle.fill")
        let buttstack = UIStackView()
        let button = UIButton()
        let rightbutton = UIButton()
        
        buttstack.axis = .horizontal
        buttstack.alignment = .fill
        buttstack.distribution = .fill
        buttstack.frame = CGRect(x: 0, y: 0, width: 330, height: 0)
        buttstack.spacing = 122
        
        var bcst = [NSLayoutConstraint]()
        button.frame = CGRect(x: 0, y: 0, width: 170, height: 75)
        button.backgroundColor = .red
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 25
        bcst.append(button.heightAnchor.constraint(equalToConstant: 55))
        bcst.append(button.widthAnchor.constraint(equalToConstant: 150))
        NSLayoutConstraint.activate(bcst)
        
        var rbcst = [NSLayoutConstraint]()
        rightbutton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        //rightbutton.backgroundColor = .yellow
        rightbutton.setBackgroundImage(symbol, for: .normal)
        rightbutton.contentMode = .scaleToFill
        
        //rbcst.append(rightbutton.heightAnchor//.constraint(equalToConstant: 75))
        rbcst.append(rightbutton.widthAnchor.constraint(equalToConstant: 10))
        //NSLayoutConstraint.activate(rbcst)
        
        buttstack.addArrangedSubview(button)
        buttstack.addArrangedSubview(rightbutton)
        formlist.addArrangedSubview(buttstack)
        
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
    
    @IBAction func debugpush(_ sender: Any) {
        addbut(text: "newbutton")
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

