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
    func getanno() -> PDFDocument  {
        let pdfloc = URL(fileURLWithPath: "/Users/lydess/Desktop/PDFs/newpdf.pdf")
        let save = URL(fileURLWithPath: "/Users/lydess/Desktop/PDFs/generaton.pdf")
        let savestring = "/Users/lydess/Desktop/PDFs/generaton.pdf"
        let doc = PDFDocument(url: pdfloc)
        return doc!
        
        
        
        
    }
    func elig(answers:NSMutableArray) {
        
    }
}
class templates {
    // Initalizes an empty list for each type, has a function for each list to generate values based on provied template ID (hardcoded solution that will be
    // turned into a GUI feature in the future 
    
    var hc = templatetext()
    var questions = [String]()
    var Qtypes = [Any]()
    var answers = NSMutableArray()
    var forms = [String]()
    
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
    func Getanswers(tempid:Int) -> [Any] {
        var answer = [Any]()
        
        switch tempid {
        case 0:
            answer = hc.questiontypes()
        default:
            answer = [Any]()
        }
        return answer
    }
    func getlists() -> [Array<String>]{
        let jacks = hc.cbxquestions()
        return jacks
    }
    func getbuttons() ->  [String] {
        let jacks = hc.formnames()
        return jacks
    }
    func getnewspictures() -> [UIImage] {
        var imagestack = [UIImage]()
        let page1 = UIImage(imageLiteralResourceName: "dogs")
        let page2 = UIImage(imageLiteralResourceName: "news")
        let page3 = UIImage(imageLiteralResourceName: "grad")
        imagestack.append(page1)
        imagestack.append(page2)
        imagestack.append(page3)
        return imagestack
    }
    func gettitles() -> [String] {
        var stringlist = [String]()
        let page1 = "Dog grooming back on at Wallan!, contact Wallan reception to Learn more"
        let page2 = "New cafe/training"
        let page3 = "Graduations are on now, come celebrate with our students on thier achivements"
        
        stringlist.append(page1)
        stringlist.append(page2)
        stringlist.append(page3)
        return stringlist
    }
    func getcampusimages() -> [UIImage] {
        var imagestack = [UIImage]()
        let wallan = UIImage(imageLiteralResourceName: "wallan")
        let fryers = UIImage(imageLiteralResourceName: "fryers")
        let archer = UIImage(imageLiteralResourceName: "archer")
        let seymour = UIImage(imageLiteralResourceName: "seymour")
        let tone = UIImage(imageLiteralResourceName: "tone")
        let benalla = UIImage(imageLiteralResourceName: "benalla")
        let docker = UIImage(imageLiteralResourceName: "docker")
        
        imagestack.append(wallan)
        imagestack.append(fryers)
        imagestack.append(archer)
        imagestack.append(seymour)
        imagestack.append(tone)
        imagestack.append(benalla)
        imagestack.append(docker)
   
        return imagestack
    }
    func getcampustitles() -> [String] {
        var stringstack = [String]()
        stringstack.append("Wallan")
        stringstack.append("Fryers st")
        stringstack.append("Archer")
        //stringstack.append("William Orr")
        stringstack.append("Docker st")
        stringstack.append("Benalla")
        stringstack.append("Seymour")
        stringstack.append("Tone rd")
        return stringstack
    }
    
}


class fsatemp {
    
    var lists = templates()
    var hc = templatetext()

    func setup() {
        lists.questions = hc.fsatext()
        lists.Qtypes = hc.questiontypes()
        
    }
    
}
