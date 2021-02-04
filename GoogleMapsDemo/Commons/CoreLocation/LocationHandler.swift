//
//  LocationHandler.swift
//  GoogleMapsDemo
//
//  Created by Milton Palaguachi on 2/4/21.
//
import CoreLocation
import UIKit
protocol LocationHandlerDelegate: AlertHandler {
    func userLocation(location: CLLocation)
    func locationDidFailWithError(error: Error)
}

class LocationHandler: NSObject {
    private lazy var locationManager: CLLocationManager = {
        let location = CLLocationManager()
        location.delegate = self
        location.desiredAccuracy = kCLLocationAccuracyBest
        location.pausesLocationUpdatesAutomatically = true
        location.distanceFilter = 5
        location.showsBackgroundLocationIndicator = true
        return location
    }()
    
    weak var delegate: LocationHandlerDelegate?
    // MARK: - Get User Location
    public func getUserLocation() {
        
        if CLLocationManager.locationServicesEnabled() {
            self.checkAndProntLocationAuthorization()
            
        } else {
            let title = "Location Disabled"
            let message = "Please enable your location service"
            self.callAlertController(title, message, butttons: [.cancel, .settings])
        }
    }
    
    private func checkAndProntLocationAuthorization() {
        let title = "Location Denied"
        let message = "Please give acess to your location"
        switch CLLocationManager.authorizationStatus() {
        case .restricted, .denied:
            self.callAlertController(title, message, butttons: [.cancel,.settings])
        case .authorizedAlways, .authorizedWhenInUse:
            self.locationManager.startUpdatingLocation()
        default: break
        }
    }
    
    private func callAlertController(_ title: String?, _ message: String?, butttons: [ActionType]) {
        self.delegate?.showAlert(title, message, actions: butttons){ actionType in
            switch actionType {
            case .settings:
                UIApplication.openSettings()
            default: break
            }
        }
    }
}

extension LocationHandler: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.locationManager.stopUpdatingLocation()
        self.delegate?.userLocation(location: location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.delegate?.locationDidFailWithError(error: error)
    }
}
