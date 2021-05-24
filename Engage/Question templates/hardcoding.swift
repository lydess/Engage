//
//  hardcoding.swift
//  Engage
//
//  Created by william Vise on 2/4/21.
//
// to be removed after inital setup, will use Coredata to deliver a better user experience
import Foundation
import UIKit
/*
0. yes/no
1. textfield
2. single answer checkbox
3. multianswer checkbox
4. other checkbox
*/


class templatetext {
    func fsatext() -> [String] {
        let qtext =  [
        "Are you currently an australian citizen 🦘 ",
        "Do you live in victoria 🚋 ",
        "Will you be doing 2 courses at the same time as this one? 📚",
        "Are you currently enrolled in secondary school? 🏫",
        "Are you undertaking a school based traineeship 👨‍🔧",
        "Are you above the age of 20?",
        "You're done!"
        ]
        return qtext
    }
    
    func formnames() -> [String] {
        let qtext =  [
        "Enquiry questions",
        "Enrollment form",
        "FSA-151",
        "Survey"
        ]
        return qtext
    }
    func questiontypes() -> [Any] {
        let qtype = [
            workingdata.questiontypes.trueFalse,
            workingdata.questiontypes.trueFalse,
            workingdata.questiontypes.checkBoxmulti,
            workingdata.questiontypes.checkBox,
            workingdata.questiontypes.trueFalse,
            workingdata.questiontypes.textBox,
            workingdata.questiontypes.formCompelte
        ]
        return qtype
    }
    func cbxquestions() -> [Array<String>] {
        var result = [Array<String>]()
        let q1 = [String]()
        let q2 = [String]()
        let q3 = ["box1","box2", "box3", "box4" ]
        let q4 = ["box1","box2", "box3", "box4" ]
        let q5 = ["box1","box2", "box3", "box4" ]
        let q6 = [String]()
        let q7 = [String]()
        result.append(q1)
        result.append(q2)
        result.append(q3)
        result.append(q4)
        result.append(q5)
        result.append(q6)
        result.append(q7)
        return result
    }
    struct campusinfo {
        var name = String()
        var address = String()
        var services = String()
        
        func generatecampus() {
            
            
        }
    }
}
