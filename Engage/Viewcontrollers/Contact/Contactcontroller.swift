//
//  Contactcontroller.swift
//  Engage
//
//  Created by william Vise on 11/5/21.
//

import Foundation
import UIKit

class contactcontroller: UIViewController {
    var CVheight = 280
    var CVwidth = 376
    var spacing = 10
    var campuses = 0
    var nextasset = 0
    var nextcolor = 0
    var clr = colors()
    var tap = UIGestureRecognizer(target: Any?.self, action: #selector(imgtapped))
    var step = 0
    
    
    @IBOutlet weak var masterstack: UIStackView!
    @IBOutlet weak var scrollbar: UIScrollView!
    @IBOutlet weak var masterview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var screensize = UIScreen.main.bounds
        CVwidth = Int(screensize.width)
        masterstack.alignment = .center
    
        
        for x in 0...6 {
            buildviews()
        }
    }
    func buildviews() {
        var clrlist = clr.colorlist()
        var CVnextspot = 30 + campuses
        var campusview = campusview(frame: CGRect(x: 0, y: CVnextspot, width: CVwidth, height: CVheight))
//        campusview.translatesAutoresizingMaskIntoConstraints = false
//        var conlist = [NSLayoutConstraint]()
//        var leadingconst = campusview.trailingAnchor.constraint(equalTo: campusview.trailingAnchor, constant: +20)
//        conlist.append(leadingconst)
//        NSLayoutConstraint.activate(conlist)
        
        campusview.axis = .vertical
        addcontent(stack: campusview)
        campusview.backgroundColor = clrlist[nextasset]
        campusview.contentMode = .center
       
        
        //campusview.alignment = .center
        
        masterstack.addSubview(campusview)
        campuses += CVheight + spacing
        if nextcolor >= 5 {
            nextcolor = 0
        }else{nextcolor += 1}
        nextasset += 1
        
    
        
    }
    
    func addcontent(stack: campusview) {
        let assets = templates()
        let piclist = assets.getcampusimages()
        let titlelist = assets.getcampustitles()
        
        let photo = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: CVheight))
        
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        var strain = [NSLayoutConstraint]()
        strain.append(photo.heightAnchor.constraint(equalToConstant: 260))
        //strain.append(photo.widthAnchor.constraint(equalToConstant: 375))
        NSLayoutConstraint.activate(strain)
       
       
       
        photo.setTitle(titlelist[nextasset], for: .normal)
        photo.contentVerticalAlignment = .bottom
        photo.titleLabel?.textAlignment = .center
        photo.titleLabel?.font = UIFont(name: "Poppins Bold", size: 22)
        photo.titleLabel?.tintColor = .white
        photo.tag = step
        step += 1
        
        photo.setBackgroundImage(piclist[nextasset], for: .normal)
        photo.addTarget(self, action: #selector(taped), for: .touchDown)
        stack.addArrangedSubview(photo)
        
       
        
        stack.addGestureRecognizer(tap)
        
        if nextasset == piclist.count-1 {
            nextasset = 0
        }
        
    }
    @objc func taped(sender: UIButton){
        workingdata.selectedcampus = sender.tag
        performSegue(withIdentifier: "campusinfo", sender: Any?.self)
    }
    @objc func imgtapped() {
        print("imgtapped")
        
    }
}
