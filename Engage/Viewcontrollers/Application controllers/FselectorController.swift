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
    var temple = templates()
    var const = [NSLayoutConstraint]()
    let alert = UIAlertController(title: "Already working on a form", message: "Select again to delete your current form", preferredStyle: .alert)
    let action = UIAlertAction(title: "Error", style: .destructive, handler: {_ in workingdata.wipeout() })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalize()
        toptext.text = ("Hello " + workingdata.userid + ", Here are the tasks we need you to complete")
       
    }
    
    func initalize() {
        
        uibuild()
    }
    
    func uibuild() {
        switch workingdata.userstep {
        case 0:
            for x in 0...1{
                addbut(text: temple.getbuttons()[x], id: x)
            }
        case 1:
            for x in 2...4{
                addbut(text: temple.getbuttons()[x], id: x)
            }
        default:
            print("cases are broken")
        }
        
    }

    func addbut(text: String, id: Int) {
        let symbol = UIImage(systemName: "info.circle.fill")
        let buttstack = UIStackView()
        let button = UIButton()
        let rightbutton = UIButton()
        var bcst = [NSLayoutConstraint]()
        
        buttstack.axis = .horizontal
        buttstack.alignment = .fill
        buttstack.distribution = .fill
        buttstack.frame = CGRect(x: 0, y: 0, width: 330, height: 0)
        buttstack.spacing = 122
        
        button.frame = CGRect(x: 0, y: 0, width: 170, height: 75)
        button.backgroundColor = .red
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
        button.tag = id
        
        bcst.append(button.heightAnchor.constraint(equalToConstant: 55))
        bcst.append(button.widthAnchor.constraint(equalToConstant: 150))
        
        rightbutton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        rightbutton.setBackgroundImage(symbol, for: .normal)
        rightbutton.contentMode = .scaleToFill
    
        NSLayoutConstraint.activate(bcst)
        
        buttstack.addArrangedSubview(button)
        buttstack.addArrangedSubview(rightbutton)
        
        formlist.addArrangedSubview(buttstack)
        
    }
    @objc func click(sender: UIButton) {
        var readyfortransfer = false
        print("Clicked a button " + sender.titleLabel!.text!)
        
        if workingdata.alreadyworking == true {
            print("dont do dat, already workin")
        }
        else{
            data.templateset(templateid: sender.tag)
            workingdata.alreadyworking = true
            readyfortransfer = true
            
        }
        if readyfortransfer == true{
            performSegue(withIdentifier: "question", sender: Any?.self)
        }
    }
    
    
    @IBAction func FSApush(_ sender: Any) {
        switch workingdata.alreadyworking {
        case true:
            self.present(alert, animated: true, completion: nil)
        default:
            data.templateset(templateid: 0)
            workingdata.alreadyworking = true
            
            
        }
    }
    
    @IBAction func debugpush(_ sender: Any) {
        addbut(text: "newbutton", id: 0)
    }
    @IBAction func homepush(_ sender: Any) {
        
    }
    
    
}

