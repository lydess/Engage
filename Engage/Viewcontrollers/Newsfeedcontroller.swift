//
//  Newsfeedcontroller.swift
//  Engage
//
//  Created by william Vise on 5/5/21.
//

import Foundation
import UIKit

class newsfeedcontroller: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
   
    var constraints = [NSLayoutConstraint]()
    var step = 0
    var mycontrollers = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let vc1 = UIViewController()
        let vc1sub = UIView()
        var const = [NSLayoutConstraint]()
        const.append(vc1sub.leadingAnchor.constraint(equalTo: vc1.view.leadingAnchor))
        const.append(vc1sub.trailingAnchor.constraint(equalTo: vc1.view.trailingAnchor))
        const.append(vc1sub.topAnchor.constraint(equalTo: vc1.view.topAnchor))
        const.append(vc1sub.bottomAnchor.constraint(equalTo: vc1.view.bottomAnchor))
        
        vc1.view.backgroundColor = .green
        vc1.view.translatesAutoresizingMaskIntoConstraints = false
        vc1sub.backgroundColor = .blue
        vc1.view.addSubview(vc1sub)
        
        
        mycontrollers.append(vc1)
        //NSLayoutConstraint.activate(const)
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .systemGreen
        var view2 = vc2.view
        var label = UILabel(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        vc2.view.translatesAutoresizingMaskIntoConstraints = false
        
        mycontrollers.append(vc2)
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .yellow
        vc3.view.translatesAutoresizingMaskIntoConstraints = false
        
        mycontrollers.append(vc3)
        
        NSLayoutConstraint.activate(constraints)
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.presentPageVC()
        }
        )
        }
    
    func presentPageVC() {
        guard let first = mycontrollers.first else {
            return
        }
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        vc.dataSource = self
        vc.delegate = self
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .popover
        vc.preferredContentSize = CGSize(width: 300, height: 300)
        
        
        present(vc, animated: true, completion: nil)
        NSLayoutConstraint.activate(constraints)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = mycontrollers.firstIndex(of: viewController), index > 0 else {
            return nil
        }
       let before = index - 1
        
        return mycontrollers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = mycontrollers.firstIndex(of: viewController), index < (mycontrollers.count - 1) else {
            return nil
        }
        let after = index + 1
        step += 1
        return mycontrollers[after]
    }
    }


