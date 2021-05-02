//
//  File.swift
//  Engage
//
//  Created by william Vise on 30/4/21.
//

import Foundation
import  UIKit

class pageviewcontroller: UIPageViewController{
    
    
    @IBOutlet weak var topbar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("welcome to course info")
        initalize()
    }
    
    func initalize() {
        var datasource = UIPageViewControllerDataSource.self
        let viewlist = [UIViewController]()
        let firstview = UIViewController()
        
        
        
        firstview.view.backgroundColor = .yellow
        firstview.view.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
        
        self.setViewControllers(viewlist, direction: .forward, animated: true, completion: {_ in print("viewsadded")})
       
        
    }
}
