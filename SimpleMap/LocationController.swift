//
//  ViewController.swift
//  SimpleMap
//
//  Created by Artem Eliseev on 05/07/2023.
//

import Foundation
import CoreLocation
import UIKit
import MapKit

enum AuthorizationStatus {
    case authorizedWhenInUse
    case restricted
    case denied
    case notDetermined
}

class LocationController: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    private var authorizationStatus: AuthorizationStatus = .notDetermined
    private var hasSetRegion = false
    private var location: CLLocation?
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 51, longitude: 0),
        span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
    )
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            
        case .authorizedWhenInUse:
            handleAuthorizedWhenInUse()
            
        case .restricted:
            handleRestricted()
            
        case .denied:
            handleDenied()
            
        case .notDetermined:
            handleNotDetermined()
            
        case .authorizedAlways:
            handleAuthorizedWhenInUse()
            
        default:
            handleNotDetermined()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        
        self.location = location
        
        if !hasSetRegion {
            region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
            hasSetRegion = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
    private func handleAuthorizedWhenInUse() {
        locationManager.requestLocation()
    }
    
    private func handleRestricted() {
        // Insert code here of what should happen when Location services are restricted
    }
    
    private func handleDenied() {
        // Insert code here of what should happen when Location services are denied
    }
    
    private func handleNotDetermined() {
        authorizationStatus = .notDetermined
        locationManager.requestWhenInUseAuthorization()
    }
}
