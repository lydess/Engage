//
//  Errors.swift
//  Engage
//
//  Created by william Vise on 6/5/21.
//

import Foundation
import UIKit
struct Errors {
    enum errorlist: Error {
        case data_not_found
        case badrequest
        case cases_are_broken
    }
}
