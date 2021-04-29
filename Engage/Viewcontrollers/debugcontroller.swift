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
    @IBOutlet weak var namefield: UITextField!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var coursefield: UITextField!
   
    @IBOutlet weak var counter: UILabel!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
        
    
    @IBAction func savenewdata(_ sender: Any) {
        
        let username = namefield.text
        let course = coursefield.text
        
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Userdata", in: context )
        let newclient = NSManagedObject(entity: entity!, insertInto: context)
        newclient.setValue(username, forKey: "username")
        newclient.setValue(course, forKey: "course")
        newclient.setValue(Int16(0), forKey: "step")
        
        
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
                        let step = (data.value(forKey: "step") as! Int16)
                        print("line " + (data.value(forKey: "username") as! String) + " " + (data.value(forKey: "course") as! String) + " " + String(step) )
                  }
                    
                } catch {
                    
                    print("Failed")
                }}
    @IBAction func Deletedata(_ sender: Any) {
        
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Userdata")
        request.returnsObjectsAsFaults = false
        
        do {
                    let result = try context.fetch(request)
                    for data in result as! [NSManagedObject] {
                        context.delete(data)
                  }
            
                    
                } catch {
                    
                    print("Failed")
                }
        do {
            try context.save()}
        catch {
            print("saving failed")
        }
        
    }
 
    
}
