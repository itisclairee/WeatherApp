//
//  LocationViewModel.swift
//  Weather
//
//  Created by Chiara Cangelosi on 14/11/23.
//

import Foundation
import CoreLocation

class LocationViewModel: NSObject,ObservableObject, CLLocationManagerDelegate
{
    //manage everything related to location
    let manager = CLLocationManager()
    
    //the location is optional since the user could refuse to grant us  access to location
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init()
    {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
       //self.setup()
    }
    
  /*  private func setup()
    {
            switch manager.authorizationStatus
        {
            case .authorizedWhenInUse:
                manager.requestLocation()
            case .notDetermined:
                manager.requestWhenInUseAuthorization()
            default:
                break
        }
    }*/
    
    func requestLocation()
    {
        isLoading = true
        manager.requestLocation()
    }
     
    //the following functions will make the CLLocationManagerDelegate work
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) 
    {
        location = locations.first?.coordinate
        isLoading = false //we got the location, so the status is not loading anymore
    }
    
    //function to handle errors
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) 
    {
        print ("Error getting location", error)
        isLoading = false //that's because we run into an error
    }
    
   
}
