//
//  swiftassets.swift
//  Engage
//
//  Created by william Vise on 5/5/21.
//

import Foundation
import UIKit

class colors {
    func colorlist() -> [UIColor]{
        var colorlist = [UIColor]()
        
        let lightblue = UIColor.init    (red: 164/255, green: 194/255, blue: 222/255, alpha: 1)
        let darkblue = UIColor.init     (red: 91/255,  green: 156/255, blue: 180/255, alpha: 1)
        let washgreen = UIColor.init    (red: 169/255, green: 197/255, blue: 180/255, alpha: 1)
        let lightgreen = UIColor.init   (red: 149/255, green: 184/255, blue: 102/255, alpha: 1)
        let orange = UIColor.init       (red: 244/255, green: 151/255, blue: 102/255, alpha: 1)
        let maroon = UIColor.init       (red: 171/255, green: 26/255,  blue: 71/255,  alpha: 1)
        let skin = UIColor.init         (red: 253/255, green: 217/255, blue: 192/255, alpha: 1)
        
        colorlist.append(lightblue)
        colorlist.append(darkblue)
        colorlist.append(washgreen)
        colorlist.append(lightgreen)
        colorlist.append(orange)
        colorlist.append(maroon)
        colorlist.append(skin)
        
        return colorlist
    }
}
