//
//  templates.swift
//  Engage
//
//  Created by william Vise on 2/4/21.
//

import Foundation
import UIKit
import PDFKit


class PDF {
    var pdf = PDFView()
    func getanno()  {
        let pdfloc = URL(fileURLWithPath: "/Users/lydess/Documents/Engage (original)/Engage/PDF/jack.pdf")
        let save = URL(fileURLWithPath: "/Users/lydess/Documents/untitled folder/testdoc")
        let savestring = "/Users/lydess/Documents/untitled folder/testdoc"
        let doc = PDFDocument(url: pdfloc)
        
        var pages = doc?.page
        
        
        
        doc?.write(toFile: savestring)
        
        
    }
    func elig(answers:NSMutableArray) {
        
    }
}
class templates {
    // Initalizes an empty list for each type, has a function for each list to generate values based on provied template ID (hardcoded solution that will be
    // turned into a GUI feature in the future 
    
    var hc = templatetext()
    var questions = [String]()
    var Qtypes = [Int]()
    var answers = NSMutableArray()
    
    // sets the question list based on given id
    func Getquestions(tempid:Int) -> [String]{
        var answer = [String]()
        
        switch tempid {
        case 0:
            answer = hc.fsatext()
        default:
            answer = [String]()
        }
        
                                    // todo, implement error handling
        return answer
    }
    
    // sets the answer type list based on given template iD
    func Getanswers(tempid:Int) -> [Int] {
        var answer = [Int]()
        
        switch tempid {
        case 0:
            answer = hc.fsatype()
        default:
            answer = [Int]()
        }
        return answer
    }
    func getlists() -> [Array<String>]{
        let jacks = hc.cbxquestions()
        return jacks
    }
}


class fsatemp {
    
    var lists = templates()
    var hc = templatetext()

    func setup() {
        lists.questions = hc.fsatext()
        lists.Qtypes = hc.fsatype()
    }
    
}
