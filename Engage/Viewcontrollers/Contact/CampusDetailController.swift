//
//  CampusDetailController.swift
//  Engage
//
//  Created by william Vise on 25/5/21.
//

import UIKit
import MapKit
class CampusDetailController: UIViewController {
    
    @IBOutlet weak var homebutton: UIButton!
    
    @IBOutlet weak var bigmap: MKMapView!
    @IBOutlet weak var servicesfield: UITextView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var Titletext: UILabel!
    
    @IBOutlet weak var coursearea: UITextView!
    var data = campusdataobject()
    override func viewDidLoad() {
        super.viewDidLoad()
        initalize()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        initalize()
    }
    
    func initalize() {
        var campusdata = data.getcampus(campname: workingdata.currentcampus)
        
        homebutton.contentVerticalAlignment = .fill
        homebutton.contentHorizontalAlignment = .fill
        Titletext.text = campusdata.name
        address.text = campusdata.address
        coursearea.text = campusdata.courses
        servicesfield.text = campusdata.services
        bigmap.centerCoordinate = .init(latitude: campusdata.cords.lat, longitude: campusdata.cords.long)
        
        
        bigmap.cameraZoomRange = MKMapView.CameraZoomRange.init(minCenterCoordinateDistance: 200, maxCenterCoordinateDistance: 700)
       
        
        
    }
    
    @IBAction func homedown(_ sender: Any) {
        self.dismiss(animated: true, completion: {})
    }
    
    
}
