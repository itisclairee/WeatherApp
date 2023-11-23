//
//  ContentView.swift
//  Weather
//
//  Created by Chiara Cangelosi on 14/11/23.
//

import SwiftUI

struct ContentView: View 
{
    // the view can be notified every time that the publisher variables in the locationmanager are updated 
    @StateObject var locationManager = LocationViewModel()
    var weatherManager = WeatherModel()
    @State var weather: ResponseBody?
    
    var body: some View 
    {
        VStack 
        {
            if let location = locationManager.location 
            {
                if let weather = weather
                {
                    WeatherView(weather: weather)
                } 
                
                else
                {
                    LoadingView()
                        .task 
                    {
                        do
                        {
                            weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                        }
                        catch
                        {
                                print("Error getting weather: \(error)")
                        }
                    }
                }
            } 
            else
            {
                if locationManager.isLoading 
                {
                    LoadingView()
                } else 
                {
                   WelcomeView()
                      .environmentObject(locationManager)

                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

