//
//  debugcontroller.swift
//  Engage
//
//  Created by william Vise on 17/4/21.
//

import Foundation


import UIKit
import SceneKit

class debugcontroller: UIViewController {
    
    @IBOutlet weak var toplabel: UILabel!
    @IBOutlet weak var debug1: UIButton!
    @IBOutlet weak var Debug2: UIButton!
    
    @IBOutlet weak var debug3: UIButton!
    @IBOutlet weak var topstack: UIStackView!
    
    @IBOutlet weak var rightstack: UIStackView!
    @IBOutlet weak var testview: UIStackView!
    
    
    var activebut = [UIStackView]()
    var tboxpool = [UITextField]()
    
    override func viewDidLoad() {
        topstack.spacing = 30.0
    }
    
    @IBAction func debug1push(_ sender: Any) {
        for x in 0...23{
            buttongen(text: "button" + String(x),id: x)
        }
        
    }
    @IBAction func debug2push(_ sender: Any) {
        buttongen2()
    }
    
    @IBAction func debug3push(_ sender: Any) {
        for x in activebut {
        print(x)
        }
    }
    func buttongen(text: String, id: Int) {
        let tbox = UITextField()
        let butt = checkbox()
       
        
        butt.frame = CGRect(x: 0, y: 0, width: 30, height: 60)
        tbox.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        butt.setImage(UIImage.init(named: "unticked"), for: .normal)
        tbox.text = text
        tbox.textColor = .black
        butt.addTarget(self, action: #selector(click), for: .touchUpInside)
        tbox.tag = id
        butt.tag = id
        
        
        
        var stackView   = UIStackView()
       	stackView = UIStackView(arrangedSubviews: [butt, tbox])
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 30.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        activebut.append(stackView)
        tboxpool.append(tbox)
        
        if topstack.arrangedSubviews.count < 12{
            topstack.addArrangedSubview(stackView)
        }
        else if rightstack.arrangedSubviews.count < 12{
            rightstack.addArrangedSubview(stackView)
        }
        else if activebut.count >= 25 {
            print("max buttons reached")
        }
        
        
//        stackView.centerXAnchor.constraint(equalTo: self.topstack.centerXAnchor).isActive = true
//        stackView.centerYAnchor.constraint(equalTo: self.topstack.centerYAnchor).isActive = true
    }
    func buttongen2() {
        func buttongen(text: String) -> checkbox {
            let pic = UIImage.init(named: "unticked")
            let button = checkbox(frame: CGRect(x: 100, y:100, width: 100, height: 20))
            button.backgroundColor = .black
            button.setTitleColor(.black, for: .normal)
            button.setImage(pic, for: .normal)
            button.setTitle("  " + text, for: .normal)
            topstack.addArrangedSubview(button)
            return button
        }
       
    }
    @objc func click(sender: checkbox) {
        
        let pic = UIImage.init(named: "ticked")
        let opic = UIImage.init(named: "unticked")
        switch sender.checked {
        case true:
            sender.setImage(opic, for: .normal)
            sender.checked = false
            
        case false:
            sender.setImage(pic, for: .normal)
            sender.checked = true
            
           
        default:
            print("somthing is seriously wrong")
        }
        
        // How to get data from the tapped button
        var clickedid = sender.tag
        for x in tboxpool {
            if x.tag == clickedid{
                
            }
        }
    }
}
