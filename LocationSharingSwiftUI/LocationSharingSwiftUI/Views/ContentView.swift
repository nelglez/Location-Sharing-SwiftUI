//
//  ContentView.swift
//  LocationSharingSwiftUI
//
//  Created by Nelson Gonzalez on 12/16/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject var locationManager = LocationObserver()
    @ObservedObject var experienceController = ExperienceController()
    @State private var alert = false
    @State private var title = ""
    @State private var showingEmptyAlert = false
    
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
           return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
       }
   
    var body: some View {
        NavigationView {
            VStack {
            HStack {
                TextField("Title", text: $title).padding().background(Color(red: 239/255, green: 243/255, blue: 244/255))
                Button(action: {
                    if !self.title.isEmpty {
                    self.experienceController.createExperience(with: self.title, coordinate: self.locationManager.lastLocation?.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0))
                        self.title = ""
                    } else {
                        self.showingEmptyAlert = true
                    }
                }) {
                    Image(systemName: "plus.circle").foregroundColor(.green).font(.largeTitle)
                }
                
                
               
            }.padding().navigationBarTitle("Experience").alert(isPresented: $showingEmptyAlert) {
                Alert(title: Text("Warning!"), message: Text("Title can't be empty, please enter something"), dismissButton: .default(Text("OK")))
                }
//        MapView(alert: $alert, coordinate: locationManager.lastLocation?.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)).alert(isPresented: $alert) {
//            Alert(title: Text("Please Enable Location Access In Settings Pannel So that we can display your location in the app."))
//        }
                
                MapView(experience: experienceController.experience, alert: $alert, coordinate: locationManager.lastLocation?.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)).alert(isPresented: $alert) {
                    Alert(title: Text("Please Enable Location Access In Settings Pannel So that we can display your location in the app."))
                }.padding()
            }
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
