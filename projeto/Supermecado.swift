//
//  Capital.swift
//  projeto
//
//  Created by iMac Mobilicidade on 14/02/2019.
//  Copyright © 2019 cesar. All rights reserved.
//
import MapKit
import UIKit

class Supermecado: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var subtitle: String?
    
    init(title: String, coordinate: CLLocationCoordinate2D, subtitle: String) {
        self.title = title
        self.coordinate = coordinate
        self.subtitle = subtitle
    }
}
