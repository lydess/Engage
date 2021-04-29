//
//  workingdata.swift
//  Engage
//
//  Created by william Vise on 2/4/21.
//

import Foundation
import UIKit
import CoreData
// stores the "at a momment" data needed for the operation of the app, is callable at any point and can be set at any time, insecure dont store creds
struct workingdata {
    static var loggedin = false
    
    
    static var doc = 1
    static var template = 0
    static var templatename = "none set"
    static var templateset = false
    
    static var qlist = [String]()
    static var alist = NSMutableArray()
    static var qtype = [Int]()
    static var qcbx = [Array<String>]()
    
    static var isworking = false
    static var alreadyworking = false
    static var menuseen = false
    static var courseview = 0
    
    static var resumedlist = NSMutableArray()
    static var resumedstep = Int()
    
    static var activeusertable = NSMutableArray()
    static var userid = "user not logged in"
    static var usercourse = String()
    static var userstep = Int16()
    
    var fsa = fsatemp()            // hardcoded, to be replaced
    var temple = templates()
    
    func templateset(templateid:Int) {
        workingdata.template = templateid
        switch workingdata.template {
        case 0:
            print("DOCTYPE is FSA151")
            workingdata.templatename = "FSA-151"
            workingdata.templateset = true
            workingdata.qlist =  temple.Getquestions(tempid: templateid)
            workingdata.qtype = temple.Getanswers(tempid: templateid)
            workingdata.qcbx = temple.getlists()
            
            
            
        default:
            print("Theres somthing wrong with your templates")
        }
    }
    static func wipeout() {
        workingdata.templatename = "none set"
        workingdata.templateset = false
        workingdata.qlist = [String]()
        workingdata.qtype = [Int]()
        workingdata.qcbx = [Array<String>]()
        workingdata.alist = NSMutableArray()
        workingdata.alreadyworking = false
        print("WORKING DATA WIPED OUT, ALL DATA IS SET TO DEFAULT VALUES")
    }
    
    static func grabdata() {
        print("dismissed")
    }
    static func setuser(data: NSManagedObject) {
        workingdata.loggedin = true
        workingdata.userid = data.value(forKey: "username") as! String
        workingdata.usercourse = data.value(forKey: "course") as! String
        workingdata.userstep = data.value(forKey: "step") as! Int16
    }
    
}
