//
//  LocationService.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 24/05/21.
//

import Foundation
import CoreLocation

protocol DelegateAuthorizationLocation:AnyObject {
    func authorizationDeniedLocation()
}

protocol DelegateLocation:AnyObject {
    func informlocation()
}

struct Coodinates {
    var latitude:Double?
    var longitude:Double?
}

class LocationService:NSObject{
    
    static let share = LocationService()
    
    weak var delegateAuthorization:DelegateAuthorizationLocation?
    
    weak var delegateLocation:DelegateLocation?
    
    var coordinates = Coodinates()
    
    // Create a CLLocationManager and assign a delegate
    lazy var locationManager:CLLocationManager = {
        let locationManger = CLLocationManager()
        locationManger.delegate = self
        return locationManger
    }()

    override init() {
        super.init()
        // Request a user’s location once
    }
    
    
    func requestAuthorization(){
        locationManager.requestLocation()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
    }
}

extension LocationService:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.isEmpty == false{
            if let location = locations.first {
                let latitude = location.coordinate.latitude
                let longitude = location.coordinate.longitude
                // Handle location update
                coordinates.latitude = latitude
                coordinates.longitude = longitude
                delegateLocation?.informlocation()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let clErr = error as? CLError {
            switch clErr {
            case CLError.locationUnknown:
                print("location unknown")
            case CLError.denied:
                delegateAuthorization?.authorizationDeniedLocation()
                print("denied")
            default:
                print("other Core Location error")
            }
        } else {
            print("other error:", error.localizedDescription)
        }
    }
    
    func locationManagerDidResumeLocationUpdates(_ manager: CLLocationManager) {
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Handle each case of location permissions
        switch manager.authorizationStatus {
        case .authorizedAlways: break
                // Handle case
            case .authorizedWhenInUse: break
                // Handle case
            case .denied:
                // Request a user’s location once
                locationManager.requestLocation()
                locationManager.requestAlwaysAuthorization()
                locationManager.requestWhenInUseAuthorization()
                // Handle case
            case .notDetermined:
                // Request a user’s location once
                locationManager.requestLocation()
                locationManager.requestAlwaysAuthorization()
                locationManager.requestWhenInUseAuthorization()
                // Handle case
            case .restricted: 
                // Request a user’s location once
                locationManager.requestLocation()
                locationManager.requestAlwaysAuthorization()
                locationManager.requestWhenInUseAuthorization()
                // Handle case
        @unknown default:
            NSLog("Status of permission not encountered")
        }
    }
}
