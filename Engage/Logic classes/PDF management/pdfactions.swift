//
//  pdfactions.swift
//  Engage
//
//  Created by william Vise on 10/5/21.
//

import Foundation
import UIKit
import PDFKit

class pdfactions {
    var tempdf = PDF()
    var savestring = "/Users/lydess/Desktop/PDFs/generaton.pdf"
    func textfield(doc: PDFDocument, atwid: Int, text: String, atpage: PDFPage) {
        let pages = doc.page(at: atwid)
        pages?.annotations[atwid].widgetStringValue = text
        
    }
}
