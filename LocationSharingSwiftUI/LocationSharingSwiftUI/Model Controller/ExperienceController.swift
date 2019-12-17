//
//  ExperienceController.swift
//  LocationSharingSwiftUI
//
//  Created by Nelson Gonzalez on 12/17/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import Foundation
import CoreLocation

class ExperienceController: ObservableObject {
    @Published private(set) var experience: Experience?
    
    func createExperience(with title: String, coordinate: CLLocationCoordinate2D) {
        let newExperience = Experience(title: title, coordinate: coordinate)
        
        experience = newExperience
    }
}
