//
//  LocationObserver.swift
//  LocationSharingSwiftUI
//
//  Created by Nelson Gonzalez on 12/16/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation
import CoreLocation
import Combine

class LocationObserver: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published private(set) var location = CLLocation()
    @Published var lastLocation: CLLocation?
    private let locationManager = CLLocationManager()
    override init() {
       
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        //Good place to send location to an expernal server.
        self.lastLocation = location
        print(location.coordinate)
        manager.stopUpdatingLocation()
    }
}
