//
//  UICollectionViewController.swift
//  Engage
//
//  Created by william Vise on 5/5/21.
//

import Foundation
import UIKit

class collectionviewcontroller: UICollectionViewController {
    let data = ["memes","yeems","leems","dreams"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: IndexPath()) as? Collectionviewcell
        
        return cell
    }
}
