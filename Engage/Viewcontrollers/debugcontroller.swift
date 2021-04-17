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
    
    
    @IBOutlet var swiperight: UISwipeGestureRecognizer!
    
    var activebut = [UIStackView]()
    var tboxpool = [UITextField]()
    
    
    override func viewDidLoad() {
        topstack.spacing = 30.0
        var keyboardType: UIKeyboardType = .numberPad
        
    }
    
    @IBAction func debug1push(_ sender: Any) {
        for x in 0...19{
            buttongen2(text: "button" + String(x),id: x)
        }
        buttongen(text: "Other", id: 20)
    }
    @IBAction func debug2push(_ sender: Any) {
        
    }
    
    @IBAction func debug3push(_ sender: Any) {
        for x in activebut {
        print(x)
        }
        
        
        
    }
    @IBAction func swiperight(_ sender: Any) {
        for x in tboxpool{
            x.endEditing(true)
        }
    }
    func buttongen(text: String, id: Int) {
        let tbox = UITextField()
        let butt = checkbox()
        
        tbox.returnKeyType = .done
        butt.frame = CGRect(x: 0, y: 0, width: 30, height: 60)
        butt.setImage(UIImage.init(named: "unticked"), for: .normal)
        butt.addTarget(self, action: #selector(click), for: .touchUpInside)
        butt.tag = id
        
        tbox.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        tbox.text = text
        tbox.textColor = .black
        tbox.tag = id
      
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
        
    }
    func buttongen2(text: String, id: Int) {
        let tbox = UILabel()
        let butt = checkbox()
       
        
        butt.frame = CGRect(x: 0, y: 0, width: 30, height: 60)
        butt.setImage(UIImage.init(named: "unticked"), for: .normal)
        butt.addTarget(self, action: #selector(click), for: .touchUpInside)
        butt.tag = id
        
        tbox.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        tbox.text = text
        tbox.textColor = .black
        tbox.tag = id
      
        var stackView   = UIStackView()
        stackView = UIStackView(arrangedSubviews: [butt, tbox])
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 30.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        activebut.append(stackView)
        
        
        if topstack.arrangedSubviews.count < 12{
            topstack.addArrangedSubview(stackView)
        }
        else if rightstack.arrangedSubviews.count < 12{
            rightstack.addArrangedSubview(stackView)
        }
        else if activebut.count >= 25 {
            print("max buttons reached")
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
                print("button clicked was " + x.text!)
                
            }
        }
    }
}
