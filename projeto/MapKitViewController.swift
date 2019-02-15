//
//  MapKitViewController.swift
//  projeto
//
//  Created by iMac Mobilicidade on 14/02/2019.
//  Copyright © 2019 cesar. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapKitViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    private var currentLocation: CLLocation?
    private var noUpdate = true
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
   
        mapView.showsUserLocation = true

        mapView.delegate = self
        mapView.mapType = .standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        if let coor = mapView.userLocation.location?.coordinate{
            mapView.setCenter(coor, animated: true)
        }
        
        let Hiper = Supermecado(title: "Bompreço Benfica", coordinate: CLLocationCoordinate2D(latitude: -8.0493014, longitude: -34.9429431), subtitle: "(81) 3073-2000")
        let Extra = Supermecado(title: "Extra - Recife", coordinate: CLLocationCoordinate2D(latitude: -8.0470482, longitude: -34.9546791), subtitle: "(81) 3221-3254")
        let RMExpress = Supermecado(title: "RM Express", coordinate: CLLocationCoordinate2D(latitude: -8.0343169, longitude: -34.9501318), subtitle: "(81) 3036-0500")
        let ArcoMix = Supermecado(title: "Supermercardos Arco-Mix", coordinate: CLLocationCoordinate2D(latitude: -8.0435129, longitude: -34.9438396), subtitle: "(81) 3274-8350")
        let Extrabom = Supermecado(title: "Supermercado Extrabom", coordinate: CLLocationCoordinate2D(latitude: -8.0674572, longitude: -34.9506367), subtitle: "(81) 3251-0210")
        
        mapView.addAnnotations([Hiper,Extra,RMExpress,ArcoMix,Extrabom])

    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if(noUpdate){
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        
        mapView.mapType = MKMapType.standard
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locValue, span: span)
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = "MyLocation"
        annotation.subtitle = ""
        mapView.addAnnotation(annotation)
        noUpdate = false
           
        }
    }
}
