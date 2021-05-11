//
//  Newsfeedcontroller.swift
//  Engage
//
//  Created by william Vise on 5/5/21.
//

import Foundation
import UIKit
class newsfeedcontroller: UIViewController {
    var pagewidth = 322
    var pageheight = 398
    var pageno = 0
    var colorno = 0
    
    var clr = colors()
    var lists = templates()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let photos = lists.getnewspictures()
        for x in 0...photos.count-1 {
            buildbox()
            
        }
        
    }
    func buildbox() {
        let photos = lists.getnewspictures()
        let titles = lists.gettitles()
        let pageframe = CGRect(x: (pageno * pagewidth + (12 * pageno)), y: 0, width: pagewidth, height: pageheight)
        let clrlist = clr.colorlist()
        let contentbox = UIStackView()
        let image = UIImageView(frame: CGRect(x: 0, y: 90, width: 322, height: 308))
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 322, height: 90))
        let box = UIView(frame: pageframe)
        
        contentbox.axis = .vertical
        image.image = photos[pageno]
        title.textAlignment = .center
        title.text = titles[pageno]
        title.font = UIFont(name: "Poppins Bold", size: 18)
        title.numberOfLines = 5
        
        
        
        if colorno >= 6{
            colorno = 0
            box.backgroundColor = .black
        }else{
            box.backgroundColor = clrlist[colorno]
            image.backgroundColor = clrlist[colorno + 1]
        }
        colorno += 1
        
        box.addSubview(image)
        box.addSubview(title)
        
        
        pageno += 1
        
    }
    
}
