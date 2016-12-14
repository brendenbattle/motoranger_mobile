//
//  MainVC.swift
//  MotoRanger
//
//  Created by Joy Umali on 12/13/16.
//  Copyright © 2016 Joy Umali. All rights reserved.
//

import UIKit
import Mapbox
import CoreLocation

class MainVC: UIViewController, MGLMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet var mapView: MGLMapView!
    
    let locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        let mapView = MGLMapView(frame: view.bounds, styleURL: MGLStyle.satelliteStreetsStyleURL(withVersion: 9))
        
        // Tint the i (info) button and the user location annotation.
        // mapView.tintColor = .darkGray
        
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Set the map's center coordinate and zoom level here if not done on Interface Builder Storyboard
        // mapView.setCenter(CLLocationCoordinate2D(latitude: 45.52245, longitude: -122.67773), zoomLevel: 12, animated: false)

        
        view.addSubview(mapView)
        
//        mapView.delegate = self
        
        // Creating a point annotation
        let point = MGLPointAnnotation()
        point.coordinate = CLLocationCoordinate2D(latitude: 45.52258, longitude: -122.6732)
        point.title = "Voodoo Doughnut"
        point.subtitle = "22 SW 3rd Avenue Portland Oregon, U.S.A."
        
        mapView.addAnnotation(point)
        
    }
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let mapView = MGLMapView(frame: view.bounds)
        mapView.userTrackingMode = .follow
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        mapView.setCenter(center, zoomLevel: 14, animated: true)
        view.addSubview(mapView)
        self.locationManager.stopUpdatingLocation()
    }
    
//    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
//    {
//        print ("Errors:" + error.localizedDescription)
//    }
}

