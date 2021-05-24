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
class workingdata {
    
    var fsa = fsatemp()
    var temple = templates()
    
    static var loginstatus = loginstate.loggedout
    
    static var urlinfo = [String]()
    
    static var doc = 1
    static var template = 0
    static var templatename = "none set"
    static var templateset = false
    
    static var qlist = [String]()
    static var alist = NSMutableArray()
    static var qtype = [Any]()
    static var checkBoxQuestions = [Array<String>]()
    
    static var isworking = false
    static var alreadyworking = false
    static var menuseen = false
    static var currentCourseView = coursetypes.mainMenu
    static var selectedCourse = "NO_COURSE_SELECTED"
    
    static var resumedlist = NSMutableArray()
    static var resumedstep = Int()
    
    static var activeusertable = NSMutableArray()
    static var userid = "user not logged in"
    static var usercourse = String()
    static var userstep = Int16()
    
    static var selectedcampus = Int()
    static var campusobject:campus = campus(name: "default", address: "default")
    static var progress = Float(0.0)
    
    static var shownews = false

    static var state = loginstate.abortedlogin
    
    enum loginstate {
        case loggedout
        case attemptinglogin
        case abortedlogin
        case justloggedin
        case loggedin
    }
    enum coursetypes {
        case mainMenu
        case technicalTrades
        case healthAndCommunity
        case landAndAnimals
        case businessAndTechnology
        case shortCourses
        
    }
    
    enum questiontypes {
        case trueFalse
        case textBox
        case checkBox
        case checkBoxmulti
        case checkBoxOther
        case formCompelte
    }
    
    
    
    func templateset(templateid:Int) {
        workingdata.template = templateid
        switch workingdata.template {
        case 0:
            print("DOCTYPE is FSA151")
            workingdata.templatename = "FSA-151"
            workingdata.templateset = true
            workingdata.qlist =  temple.Getquestions(tempid: templateid)
            workingdata.qtype =  temple.Getanswers(tempid: templateid)
            workingdata.checkBoxQuestions = temple.getlists()
            
            
            
        default:
            print("Theres somthing wrong with your templates")
        }
    }
    static func wipeout() {
        workingdata.templatename = "none set"
        workingdata.templateset = false
        workingdata.qlist = [String]()
        workingdata.qtype = [Int]()
        workingdata.checkBoxQuestions = [Array<String>]()
        workingdata.alist = NSMutableArray()
        workingdata.alreadyworking = false
        print("WORKING DATA WIPED OUT, ALL DATA IS SET TO DEFAULT VALUES")
    }
    
    static func grabdata() {
        print("dismissed")
    }
    static func setuser(data: NSManagedObject) {
        workingdata.loginstatus = .loggedin
        workingdata.userid = data.value(forKey: "username") as! String
        workingdata.usercourse = data.value(forKey: "course") as! String
        workingdata.userstep = data.value(forKey: "step") as! Int16
    }
    
}
