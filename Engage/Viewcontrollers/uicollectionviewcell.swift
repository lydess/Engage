//
//  uicollectionviewcell.swift
//  Engage
//
//  Created by william Vise on 5/5/21.
//

import Foundation
import UIKit

class Collectionviewcell: UICollectionViewCell {
    @IBOutlet weak var toplabel: UILabel!
    
    func configure(name: String) {
        toplabel.text = name
    }
}
