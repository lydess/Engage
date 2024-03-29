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
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var startlabel: UILabel!
    @IBOutlet weak var home: UIButton!
    var db = DB()
    var data = workingdata()
    var temple = templates()
    var const = [NSLayoutConstraint]()
    let alert = UIAlertController(title: "Already working on a form", message: "Select again to delete your current form", preferredStyle: .alert)
    let action = UIAlertAction(title: "Error", style: .destructive, handler: {_ in workingdata.wipeout() })
    var activerightbuts = [UIButton]()
    var activebuts = [UIButton]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        progress.setProgress(workingdata.progress, animated: false)
        NotificationCenter.default.addObserver(self, selector: #selector(formdone), name: NSNotification.Name(rawValue: "formdone"), object: nil)
        
        initalize()
        checkcompletion()
        
        
       
    }
    @objc func reload() {
        super.viewDidAppear(true)
    }
    override func viewDidAppear(_ animated: Bool) {
        progressbar()
        
    }
    
    
    func initalize() {
        
        
        uibuild()
        //status.alpha = 0
    }
    func progressbar() {
        var step = db.getstep()
        if db.getchanged() == true {
            switch step {
            case 0:
                workingdata.progress = 0.25
                progress.setProgress(workingdata.progress, animated: true)
                db.setchanged(answer: false)
            case 1:
                workingdata.progress = 0.50
                progress.setProgress(workingdata.progress, animated: true)
                db.setchanged(answer: false)
            default:
                print("cases are fucked")
            }
            
        
        }
    }
    func checkcompletion() {
        
    }
    @objc func formdone() {
        activebuts.removeAll()
        formlist.removeArrangedSubview(formlist.arrangedSubviews[0])
        uibuild()
        reload()
    }
    func uibuild() {
        switch workingdata.userstep {
        case 0:
            for x in 0...0{
                addbut(text: temple.getbuttons()[x], id: x)
                
            }
            var blub = UIImageView()
        
            if db.checkform() == true {
                let EQbutton = activebuts[0]
                let img = UIImage(systemName: "checkmark.seal")
                activerightbuts[0].setImage(img, for: .normal)
                startlabel.alpha = 0
                status.alpha = 1
                status.text = """
Thanks! \(workingdata.userid), Based on your answers given, the app lets you know what your potential fees will be.\r\n \r\n Your Enquiry is now being handed over to our Engagement team! they will call soon to work out a good time for a chat about your study options, or you can respond to emails and in the future live chat messages from right here in the app!
"""
                status.font = UIFont(name: "Poppins Bold", size: 15)
                status.textColor = .white
                EQbutton.setTitleColor(.black, for: .normal)
                EQbutton.backgroundColor = .gray
                EQbutton.isUserInteractionEnabled = false
            
            }else{
                startlabel.font = UIFont(name: "Poppins Bold", size: 18)
                startlabel.textColor = .white
                startlabel.numberOfLines = 10
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
        button.backgroundColor = .orange
        button.setTitle(text, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(click), for: .touchUpInside)
        button.tag = id
        
        bcst.append(button.heightAnchor.constraint(equalToConstant: 55))
        bcst.append(button.widthAnchor.constraint(equalToConstant: 150))
        
        rightbutton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        rightbutton.contentMode = .scaleToFill
        rightbutton.tag = id
        
        activebuts.append(button)
        activerightbuts.append(rightbutton)
    
        NSLayoutConstraint.activate(bcst)
        
        buttstack.addArrangedSubview(button)
        //buttstack.addArrangedSubview(rightbutton)
        
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
       // addbut(text: "newbutton", id: 0)
        print(db.checkform())
    
    }
    @IBAction func homepush(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }
    
    @IBAction func debugdown(_ sender: Any) {
        print(db.getstep())
    }
    
}

