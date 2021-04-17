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
        "Is the sky blue ?",
        "what is your name",
        "Whats your favrioute box",
        "pick your top 3 boxes",
        "spesify a better checkbox",
        ]
        return qtext
        
    }
    func fsatype() -> [Int] {
        let qtype = [0,1,2,3,4]
        return qtype
    }
    func cbxquestions() -> [Array<String>] {
        var result = [Array<String>]()
        let q1 = [String]()
        let q2 = [String]()
        let q3 = ["box1","box2", "box3", "box4" ]
        let q4 = ["box1","box2", "box3", "box4" ]
        let q5 = ["box1","box2", "box3", "box4" ]
        result.append(q1)
        result.append(q2)
        result.append(q3)
        result.append(q4)
        result.append(q5)
        return result
    }
}
