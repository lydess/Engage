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
        var campusview = UIStackView(frame: CGRect(x: 0, y: CVnextspot, width: CVwidth, height: CVheight))
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
    
    func addcontent(stack: UIStackView) {
        var assets = templates()
        var piclist = assets.getcampusimages()
        var titlelist = assets.getcampustitles()
        
        var title = UILabel(frame: CGRect(x: 0, y: 0, width: CVwidth, height: 30))
        var photo = UIImageView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        var strain = [NSLayoutConstraint]()
        strain.append(photo.heightAnchor.constraint(equalToConstant: 250))
        //strain.append(photo.widthAnchor.constraint(equalToConstant: 375))
    
        NSLayoutConstraint.activate(strain)
        title.text = titlelist[nextasset]
        title.textAlignment = .center
        title.font = UIFont(name: "Poppins Bold", size: 20)
        title.textColor = .white
        
        photo.image = piclist[nextasset]
        stack.addArrangedSubview(photo)
        stack.addArrangedSubview(title)
        
        if nextasset == piclist.count-1 {
            nextasset = 0
        }
        
    }
}
