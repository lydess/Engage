//
//  debugcontroller.swift
//  Engage
//
//  Created by william Vise on 17/4/21.
//

import Foundation

import CoreData
import UIKit
import SceneKit
import CoreHaptics

class debugcontroller: UIViewController {
    @IBOutlet weak var newdata: UIButton!
    @IBOutlet weak var printdata: UIButton!
    @IBOutlet weak var debug3: UIButton!
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
        
    
    @IBAction func savenewdata(_ sender: Any) {
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Userdata", in: context )
        let newclient = NSManagedObject(entity: entity!, insertInto: context)
        newclient.setValue("lydess", forKey: "username")
        
        do {
            try context.save()}
        catch {
            print("saving failed")
        }
    }
    
    @IBAction func printalldata(_ sender: Any) {
        
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Userdata")
        request.returnsObjectsAsFaults = false
        
        do {
                    let result = try context.fetch(request)
                    for data in result as! [NSManagedObject] {
                       print(data.value(forKey: "username") as! String)
                  }
                    
                } catch {
                    
                    print("Failed")
                }}
    @IBAction func debug3push(_ sender: Any) {
        
        
        
        
        
    }
 
}
