//
//  PDFdirector.swift
//  Engage
//
//  Created by william Vise on 10/5/21.
//

import Foundation
import PDFKit

class pdfdirector {
    let actions = pdfactions()
    let parser = pdfparse()
    let pdf = PDF()
    
    
    
    func main() {
        var annos = parser.getinfo(doc: pdf.getanno())
        var step = 0
        var blist = getbuttons()
        
        for x in blist{
           
            if x.widgetFieldType != .button{
                blist.remove(at: step)
                print("removed" + x.fieldName!)
            }
            step += 1
        }
        print(blist.count)
        print(blist[0].fieldName)
        
        
        
        
    }
    
    func groupbools() -> [[PDFAnnotation]] {
        var annos = parser.getinfo(doc: pdf.getanno())
        var result = [[PDFAnnotation]]()
        var check = [PDFAnnotation]()
        for x in annos{
            
        }
        
        
        return result
    }
    
    func getbuttons() -> [PDFAnnotation] {
        var annos = parser.getinfo(doc: pdf.getanno())
        var step = 0
        for x in annos{
            
            if x.widgetFieldType != .button{
                annos.remove(at: step)
                print("removed" + x.fieldName!)
            }
            step += 1
        }
        return annos
    
        
    }
    func edit(answers: NSMutableArray) {
        
    }
}

struct boolfield {
    var base: [PDFAnnotation]
    init(base: PDFAnnotation) {
        self.base = [PDFAnnotation]()
    }
    
    
    
    
    
}
