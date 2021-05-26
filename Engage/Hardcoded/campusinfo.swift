//
//  campusinfo.swift
//  Engage
//
//  Created by william Vise on 25/5/21.
//

import Foundation

class campusdataobject {
    struct rawdata {
        var name = ""
        var services = ""
        var address = ""
        var courses = ""
        var cords = coordinates(lat: 0, long: 0)
        
    }
    struct coordinates {
        var lat = 0.00
        var long = 0.00
    }
    enum campuses {
        case Fryers
        case William
        case Archer
        case Docker
        case Tone
    }
    func getcampus(campname: campuses) -> rawdata {
        var answer = rawdata()
        switch campname {
        
        case .Fryers:
            answer = rawdata.init( name: nameslist[0],
                                  services: (serviceslist[0] + "\r\n" + serviceslist[1]),
                                  address: addresslist[0],
                                  courses: (courseslist[0] + "\r\n" + courseslist[1] + "\r\n" + courseslist[2]),
                                  cords: coordinates(lat: -36.38008086785325, long: 145.40489945545173))
        case .Archer:
            answer = rawdata.init(name: nameslist[1], services: "", address: addresslist[1], courses: courseslist[2] + "\r\n", cords: coordinates(lat: -36.40179721417249, long: 145.4088234425202))
        default:
            print("FAILURE")
        }
        return answer
        
    }
   
    var nameslist = [
                     "Fryers st Shepparton",
                     "William Orr Shepparton",
                     "Archer st Shepparton",
                     "Docker st Wangaratta",
                     "Tone Rd Wangaratta"
    ]
    var serviceslist = [
                        "Cafe",
                        "Haircut appointments",
                        "Dog grooming appointments",
                        "Spa and massage appointments"
    ]
    var addresslist = [
                "152/200 Fryers st Shepparton VIC 3630",
                "260 Wanganui Road, Shepparton VIC 3630",
                "290-300 Archer Street, Shepparton VIC 3630",
                "27 Docker Street, Wangaratta VIC 3677",
                "218 Tone Road, Wangaratta VIC 3677"
    ]
    var courseslist = [
                    "Nursing",
                    "Trades",
                    "Business and IT",
                    "Community and Health"
        
    ]
}
