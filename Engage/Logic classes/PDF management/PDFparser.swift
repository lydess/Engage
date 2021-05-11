//
//  PDFparser.swift
//  Engage
//
//  Created by william Vise on 10/5/21.
//

import Foundation
import PDFKit

class pdfparse {
    func getinfo(doc: PDFDocument) -> [PDFAnnotation] {
        var pageno = doc.pageCount
        var annolist = [PDFAnnotation]()
        for x in 0...pageno-1 {
            var pageannos = doc.page(at: x)?.annotations
            for x in pageannos.unsafelyUnwrapped{
                annolist.append(x)
            }
        }
        return annolist
    }
}
