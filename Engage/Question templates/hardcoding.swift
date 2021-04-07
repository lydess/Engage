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
}
