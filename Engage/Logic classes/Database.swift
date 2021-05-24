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
    
    func checkIfUserDuplicate(givenname: String) -> Bool {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Userdata")
        var userIsFound = Bool()
        let pred = NSPredicate(format: "username == '\(givenname)'")
        request.predicate = pred
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try! context.fetch(request)
            for x in result as! [NSManagedObject] {
                if x.value(forKey: "username") as! String == givenname {
                    print("user was found")
                    //workingdata.setuser(data: x)
                    
                    userIsFound = true
                    
                }else{
                    print("User not found")
                    userIsFound = false
                }
            }
                
            
        }
        return userIsFound
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
        let currentuser = workingdata.userid
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
        newclient.setValue(true, forKey: "changed")
        
        workingdata.setuser(data: newclient)
        do {
            try context.save()
            
            
        }
        catch {
            print("saving failed")
        }
    }
    
    func createcampus() {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Campus", in: context )
        let newcampus = NSManagedObject(entity: entity!, insertInto: context)
        
        
        newcampus.setValue("Fryers", forKey: "name")
        newcampus.setValue("15-200 Fryers st Shepparton 3630 v", forKey: "address")
        newcampus.setValue("example", forKey: "courses")
        
        do {
            try context.save()}
        catch {
            print("saving failed")
        }
        
    }
    func listcampus() -> NSManagedObject {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Campus")
        var found = Bool()
        var pred = NSPredicate(format: "name == 'fryers'")
        var memes = NSManagedObject()
        request.predicate = pred
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try! context.fetch(request)
            for x in result as! [NSManagedObject] {
                memes = x
            }
                
            
        }
        return memes
    }
    
    func getchanged() -> Bool{
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
                subject = x.value(forKey: "changed") as! Bool
                
            }
            
            
        }
        return subject
    }
    
    func setchanged(answer: Bool) {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Userdata")
        let currentuser = workingdata.userid
        let pred = NSPredicate(format: "username == '\(currentuser)'")
        request.returnsObjectsAsFaults = false
        request.predicate = pred
        
        do {
            let result = try! context.fetch(request)
            
            for x in result as! [NSManagedObject]{
                x.setValue(answer, forKey: "changed")
                
            }
            
        
    }
}
    func getstep() -> Int16 {
        var subject:Int16 = 0
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Userdata")
        let currentuser = workingdata.userid
        let pred = NSPredicate(format: "step == '\(currentuser)'")
        request.returnsObjectsAsFaults = false
        request.predicate = pred
        
        do {
            let result = try! context.fetch(request)
            
            for x in result as! [NSManagedObject]{
                subject = x.value(forKey: "step") as! Int16
                
            }
            
            
            
    }
        return subject
}
    
    func setstep(answer: Int16) {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Userdata")
        let currentuser = workingdata.userid
        let pred = NSPredicate(format: "username == '\(currentuser)'")
        request.returnsObjectsAsFaults = false
        request.predicate = pred
        
        do {
            let result = try! context.fetch(request)
            print(result.count)
            for x in result as! [NSManagedObject]{
                x.setValue(answer, forKey: "step")
                
            }
            
        
    }
        
    }
    func geteq() {
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Userdata")
        let currentuser = workingdata.userid
        let pred = NSPredicate(format: "username == '\(currentuser)'")
        request.returnsObjectsAsFaults = false
        request.predicate = pred
        
        do{
            let result = try! context.fetch(request)
            for x in result as! [NSManagedObject]{
                var word = x.value(forKey: "eqcomplete") as! Bool
                print(word)
            }
        }
    }
}
