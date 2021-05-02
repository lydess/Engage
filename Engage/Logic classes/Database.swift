//
//  Database.swift
//  Engage
//
//  Created by william Vise on 29/4/21.
//

import Foundation
import UIKit
import CoreData


// a set of methods that adds,querys and deletes objects from the database

class DB {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var example = "hi"
    
    func addnewuser(username: String, course: String) {
        
        
        
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Userdata", in: context )
        let newclient = NSManagedObject(entity: entity!, insertInto: context)
        newclient.setValue(username, forKey: "username")
        newclient.setValue(course, forKey: "course")
        
        
        do {
            try context.save()}
        catch {
            print("saving failed")
        }
    }
    
    func printalldata() {
        
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Userdata")
        request.returnsObjectsAsFaults = false
        
        do {
                    let result = try context.fetch(request)
                    for data in result as! [NSManagedObject] {
                        print("line " + (data.value(forKey: "username") as! String) + " " + (data.value(forKey: "course") as! String))
                  }
                    
                } catch {
                    
                    print("Failed")
                }}
    
    func checklogin(givenname: String) -> Bool {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Userdata")
        var found = Bool()
        var pred = NSPredicate(format: "username == '\(givenname)'")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try! context.fetch(request)
            for x in result as! [NSManagedObject] {
                if x.value(forKey: "username") as! String == givenname {
                    print("USER was found")
                    workingdata.setuser(data: x)
                    
                    found = true
                    
                }else{
                    found = false
                }
            }
                
            
        }
        return found
    }
    
    func checkform() -> Bool {
        var subject = Bool()
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Userdata")
        var currentuser = workingdata.userid
        let pred = NSPredicate(format: "username == '\(currentuser)'")
        request.returnsObjectsAsFaults = false
        request.predicate = pred
        
        
        do {
            let result = try! context.fetch(request)
            
            for x in result as! [NSManagedObject]{
                subject = x.value(forKey: "eqcomplete") as! Bool
                
            }
            
            
        }
        return subject
    }
    func finishform() {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Userdata")
        var currentuser = workingdata.userid
        let pred = NSPredicate(format: "username == '\(currentuser)'")
        request.returnsObjectsAsFaults = false
        request.predicate = pred
        
        do {
            let result = try! context.fetch(request)
            
            for x in result as! [NSManagedObject]{
                x.setValue(true, forKey: "eqcomplete")
                
            }
            try context.save()
            
        }catch{
            print("saving failed")
        }
    
}
    func sendapp(course: String, username: String) {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Userdata", in: context )
        let newclient = NSManagedObject(entity: entity!, insertInto: context)
        newclient.setValue(username, forKey: "username")
        newclient.setValue(course, forKey: "course")
        newclient.setValue(false, forKey: "eqcomplete")
        newclient.setValue(Int16(0), forKey: "step")
        
        
        do {
            try context.save()}
        catch {
            print("saving failed")
        }
    }
}
