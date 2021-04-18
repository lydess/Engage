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
    var tlabel = [UILabel]()
    var nstest = NSMutableArray()
    var genstack = UIStackView()
    var rightgenstack = UIStackView()
    var sidetoadd = true
    
    
    override func viewDidLoad() {
       
        
        genstack.axis = .vertical
        genstack.spacing = 30.0
        genstack.alignment = .fill
        genstack.frame = CGRect(x: 20, y: 150, width: 150, height: 632)
        genstack.distribution = .equalSpacing
        
        
        rightgenstack.axis = .vertical
        rightgenstack.spacing = 30.0
        rightgenstack.alignment = .fill
        rightgenstack.frame = CGRect(x: 220	, y: 150, width: 180, height: 632)
        rightgenstack.distribution = .equalSpacing
        

        self.view.addSubview(genstack)
        self.view.addSubview(rightgenstack)
        
    }
    
    @IBAction func debug1push(_ sender: Any) {
        var idstep = 0
        for x in 0...20{
            buttongen2(text: "answer " + String(x), id: x)
            idstep += 1
        }
        buttongen(text: "Other", id: idstep)
        idstep += 1
    }
    @IBAction func debug2push(_ sender: Any) {
        for x in tboxpool {
            print(x.tag)
            print(x.text)
        }
    }
    
    @IBAction func debug3push(_ sender: Any) {
        genstack.alpha = 0
        
        
        
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
        butt.frame = CGRect(x: 0, y: 0, width: 10, height: 60)
        butt.setImage(UIImage.init(named: "unticked"), for: .normal)
        butt.addTarget(self, action: #selector(otherclick), for: .touchUpInside)
        butt.tag = id
        
        
        tbox.frame = CGRect(x: 0, y: 0, width: 10, height: 30)
        tbox.text = text
        tbox.textColor = .black
        tbox.tag = id
        
      
        var stackView   = UIStackView()
       	stackView = UIStackView(arrangedSubviews: [butt, tbox])
       
        stackView.alignment = .bottom
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 7.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        activebut.append(stackView)
        tboxpool.append(tbox)
        
        
        
        if activebut.count <= 25 {
            switch sidetoadd {
            case true:
                genstack.addArrangedSubview(stackView)
            default:
                rightgenstack.addArrangedSubview(stackView)
            }
       
            
        }
        
    }
    func buttongen2(text: String, id: Int) {
        let tbox = UILabel()
        let butt = checkbox()
       
        
        butt.frame = CGRect(x: 0, y: 0, width: 10, height: 60)
        butt.setImage(UIImage.init(named: "unticked"), for: .normal)
        butt.addTarget(self, action: #selector(click), for: .touchUpInside)
        butt.tag = id
        
        
        
        tbox.frame = CGRect(x: 0, y: 0, width: 10, height: 30)
        tbox.text = text
        tbox.textColor = .purple
        tbox.tag = id
        
      
        var stackView   = UIStackView()
        stackView = UIStackView(arrangedSubviews: [butt, tbox])
        stackView.alignment = .trailing
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 3.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        tlabel.append(tbox)
        activebut.append(stackView)
        
        
        if activebut.count <= 25 {
            switch sidetoadd {
            case true:
                genstack.addArrangedSubview(stackView)
                self.sidetoadd = false
            default:
                rightgenstack.addArrangedSubview(stackView)
                self.sidetoadd = true
            }
       
            
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
        if sender.checked == true {
        for x in tlabel {
            if x.tag == clickedid{
                print("button clicked was " + x.text!)
                
            }
        }}
    }
    @objc func otherclick(sender: checkbox) {
        
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
                print("tapped")
                x.becomeFirstResponder()
                
            }
        }
    }
}
