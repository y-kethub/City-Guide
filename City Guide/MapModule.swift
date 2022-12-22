//
//  MapModule.swift
//  City Guide
//
//  Created by developer on 2022/12/22.
//

import Foundation
import MapKit



class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    @Published var region = MKCoordinateRegion()
    @Published var city = ""
    @Published var permission = false
    
    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.distanceFilter = 50 // 更新距離
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        locations.last.map {
            let center = CLLocationCoordinate2D(
                latitude: $0.coordinate.latitude,
                longitude: $0.coordinate.longitude)
            print (center)
            region = MKCoordinateRegion(
                center: center,
                latitudinalMeters: 1000.0,
                longitudinalMeters: 1000.0
            )
        }
        regeocoding()
    }
    
    func regeocoding(){
        print(self.manager.location)
        CLGeocoder().reverseGeocodeLocation(self.manager.location!) { placemarks, error in
            if let placemarks = placemarks {
                self.city = placemarks.first?.locality ?? "err"
                
            }
        }
    }
}



