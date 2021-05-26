//
//  campusinfocontroller.swift
//  Engage
//
//  Created by william Vise on 11/5/21.
//

import Foundation
import UIKit

class CampusInfoController: UICollectionViewController {
    @IBOutlet weak var coursecollection: UICollectionView!
    var jack = UIScreen()
    var cellgen = cells()
    var cellgroup = [UICollectionViewCell]()
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = coursecollection.dequeueReusableCell(withReuseIdentifier: "datacell", for: indexPath)
        let index = indexPath.row
        cell.backgroundColor = .red
        //let label = UILabel(frame: CGRect(x: 10, y: 0, width: 100, height: 20))
        //label.font = UIFont(name: "Poppins Bold", size: 17)
        //label.text = "memes"
        //label.contentMode = .top
        //label.textColor = .red
        
        
       
        
        
        
        return cell
    }
  
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            // handle tap events
            print("You selected cell #\(indexPath.item)!")
        }
    @IBOutlet weak var toplabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellgroup = cellgen.getcells()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        print("view appeared")
    }
    
}
