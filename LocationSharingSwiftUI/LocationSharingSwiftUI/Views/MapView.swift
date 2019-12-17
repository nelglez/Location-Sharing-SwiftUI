//
//  MapView.swift
//  LocationSharingSwiftUI
//
//  Created by Nelson Gonzalez on 12/16/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView : UIViewRepresentable {
    var experience: Experience?
    @Binding var alert : Bool
    let map = MKMapView()
    var coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        if experience == nil {
//           let center = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
//                   let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
//                   map.region = region
//         
           
                   return map
        } else {
            let center = CLLocationCoordinate2D(latitude: (experience?.coordinate.latitude)!, longitude: (experience?.coordinate.longitude)!)
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 1000, longitudinalMeters: 1000)
        map.region = region
//        manager.requestWhenInUseAuthorization()
//        manager.delegate = context.coordinator
//        manager.startUpdatingLocation()
//

    
        return map
        }
        
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
     //   let location: CLLocationCoordinate2D = manager.location!.coordinate
        if experience != nil {
        let point = MKPointAnnotation()
        
        point.coordinate = CLLocationCoordinate2D(latitude: (experience?.coordinate.latitude)!, longitude: (experience?.coordinate.longitude)!)
        point.title = experience?.title
        point.subtitle = "Im here"
        uiView.removeAnnotations(uiView.annotations)
       // uiView.addAnnotation(point)
        uiView.showAnnotations([point], animated: true)
        }
    }
    
    func makeCoordinator() -> MapView.Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, CLLocationManagerDelegate{
        
        var parent: MapView
        
        init(parent: MapView) {
            
            self.parent = parent
        }
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            
            if status == .denied{
                
                parent.alert.toggle()
            } else if status == .authorizedWhenInUse {
                manager.requestLocation()
            } else if status == .authorizedAlways {
                manager.requestLocation()
            }
        }
        
        //MARK: - Below handled in LocationObserver.swift
     /*
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            //Place to send location to the server.
            
            
        
            
        
          //  coordinates = annotation.coordinate
            
            
            
            
            
            
            
            
      /*
            
            
            let location = locations.last
            if location != nil {
            let point = MKPointAnnotation()
            
            /*
            let georeader = CLGeocoder()
            georeader.reverseGeocodeLocation(location!) { (places, err) in
                
                if err != nil{
                    
                    print((err?.localizedDescription)!)
                    return
                }
                
                let place = places?.first?.locality
                point.title = place
                point.subtitle = "Current"
                point.coordinate = location!.coordinate
                self.parent.map.removeAnnotations(self.parent.map.annotations)
                self.parent.map.addAnnotation(point)
                
                let region = MKCoordinateRegion(center: location!.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
                self.parent.map.region = region
            }
            */
            
            point.subtitle = "Im here"
            point.coordinate = location!.coordinate
            self.parent.map.removeAnnotations(self.parent.map.annotations)
            self.parent.map.addAnnotation(point)
            
            let region = MKCoordinateRegion(center: location!.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            self.parent.map.region = region
                manager.stopUpdatingLocation()
 
 
 
            }
 */
        }
*/
    }
    
}


