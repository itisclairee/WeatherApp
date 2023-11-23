//
//  WeatherStructureView.swift
//  Weather
//
//  Created by Chiara Cangelosi on 20/11/23.
//

import SwiftUI

struct WeatherStructureView: View 
{
    var weather: ResponseBody
    @State private var currentHour = Calendar.current.component(.hour, from: Date())
   
    
    var body: some View
    {
        VStack()
        {
            //SUMMARY VIEW
            
            VStack
            {
                Text(weather.name).bold().font(.system(size: 33)).shadow(radius: 2).foregroundStyle(.white)
                Text(weather.main.feelsLike.roundDouble()+"°").font(.system(size: 100)).shadow(radius: 2).fontWeight(.thin).foregroundStyle(.white)
                Text(weather.weather[0].main).foregroundStyle(.white).shadow(radius: 2).fontWeight(.medium)
                HStack
                {
                    Text("H:" + weather.main.tempMax.roundDouble() + "°").shadow(radius: 5).accessibilityLabel("The maximum temperature is" + weather.main.tempMax.roundDouble() + "°")
                    Text("L:" + weather.main.tempMin.roundDouble() + "°").shadow(radius: 5).accessibilityLabel("The minimum temperature is" + weather.main.tempMin.roundDouble() + "°")
                }
                .foregroundStyle(.white)
            }
            .accessibilityElement(children: .combine)
            .padding(14).padding(.top, 70)
            
            
            
            //HOURLY FORECAST VIEW
            VStack(alignment: .leading)
            {
                if(weather.weather[0].main == "Clouds")
                {
                    Text("Cloudy conditions will continue all day. Wind gusts are up to " + weather.wind.speed.roundDouble() + "km/h").foregroundStyle(.white).font(Font.system(size: 12)).fontWeight(.medium).padding(.bottom, 6)
                }
                else if (weather.weather[0].main == "Rain" || weather.weather[0].main == "Drizzle")
                {
                    Text("Rainfall is expected throughout the day, with frequent showers and possibly heavy downpours. The sky is overcast, and dark rain clouds dominate the horizon.").foregroundStyle(.white).font(Font.system(size: 12)).fontWeight(.medium).padding(.bottom, 6)
                }
                else if(weather.weather[0].main == "Clear")
                {
                    Text("Clear blue skies and bright sunshine prevail throughout the day. The temperature is warm and pleasant, providing a comfortable and enjoyable atmosphere.").foregroundStyle(.white).font(Font.system(size: 12)).fontWeight(.medium).padding(.bottom, 6)
                }
                
                Divider()
                
                /*ScrollView(.horizontal)
                {
                    HStack
                    {
                        ForEach(currentHour..<(currentHour + 24), id: \.self)
                        {
                            hour in
                            
                                VStack
                                {
                                    Text("\(hour % 24):00").foregroundStyle(.white).font(Font.system(size:14))
                                    Image(systemName: "sun.max.fill").foregroundStyle(.yellow) .padding(.vertical, 4).accessibilityLabel("Sunny")
                                    Text("20° ").foregroundStyle(.white) .font(Font.system(size: 20)).fontWeight(.medium)
                                }
                                .accessibilityElement(children: .combine)
                        .padding(.trailing, 14)
                        }
                    }
                }*/
                ScrollView(.horizontal)
                {
                    HStack
                    {
                       //ForEach(currentHour..<(currentHour + 24), id: \.self)
                        
                            
                            ForEach(hourly)
                            {
                                    cast in
                                    VStack
                                    {
                                        //Text("\(hour % 24):00").foregroundStyle(.white).font(Font.system(size:14))
                                        Text(cast.time).foregroundStyle(.white).font(Font.system(size:14))
                                        
                                        Image(systemName: cast.image).padding(.vertical, 4).foregroundStyle(.white)
                                            .accessibilityLabel("Windy")

                                        Text("\(cast.temperature)°").foregroundStyle(.white) .font(Font.system(size: 20)).fontWeight(.medium)
                                    }
                                    .accessibilityElement(children: .combine)
                            .padding(.trailing, 14)
                                }
                        
                    }
                }
            }
            .padding(14).background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius:16)).padding(.horizontal)
            
            //10 DAY FORECAST
            VStack(alignment: .leading)
            {
                //calendar parameters
                
                let calendar = Calendar.current
                let today = Date()
                let weekday = calendar.component(.weekday, from: today)
                        
                let weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
                var actualDayOfWeek = weekdays[weekday - 1]
                
                
                HStack
                {
                    Image(systemName: "calendar")
                    Text("5-DAY FORECAST")
                }
                .foregroundStyle(.white).shadow(radius: 10).font(.system(size: 12)).fontWeight(.medium)
                
                Divider()
            
                VStack(alignment: .leading, spacing: 10)
                {
                    /*ForEach(weekday - 1..<weekdays.count, id: \.self)
                    {
                        index in
                        
                        VStack
                        {
                            HStack(spacing: 15)
                            {
                                Text(weekdays[index]).foregroundStyle(.white).frame(width: 100, alignment: .leading)
                            
                                
                                Image(systemName:"sun.max.fill").foregroundStyle(.yellow).accessibilityLabel("Sunny")
                                
                                Text("13°").foregroundStyle(.white).shadow(radius: 10).accessibilityLabel("The minimum temperature is 13°")
                                ProgressView(value: 0.5, total:1.0).accessibilityLabel("Good Air Quality")
                                Text("20°").foregroundStyle(.white).shadow(radius: 10).accessibilityLabel("The maximum temperature is 13°")
                                
                            }.accessibilityElement(children: .combine)
                        }
                        
                        Divider()
                    }*/
                    
                    ForEach(daily)
                        {
                            cast in
                            
                            VStack
                            {
                                HStack(spacing: 15)
                                {
                                    Text(cast.day).foregroundStyle(.white).frame(width: 100, alignment: .leading)
                                
                                    
                                    Image(systemName: cast.image).foregroundStyle(.white)
                                        .accessibilityLabel("Cloudy")
                                    
                                    Text("\(cast.minTemp)°").foregroundStyle(.white).shadow(radius: 10)
                                        .accessibilityLabel("The minimum temperature is \(cast.minTemp)°")
                                    ProgressView(value: 0.5, total:1.0)
                                        .accessibilityLabel("Good Air Quality")
                                    Text("\(cast.maxTemp)°").foregroundStyle(.white).shadow(radius: 10)
                                        .accessibilityLabel("The maximum temperature is \(cast.maxTemp)°")
                                    
                                }.accessibilityElement(children: .combine)
                            }
                            
                            Divider()
                        }
                    
                }
            }
            .padding(14).background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16)).padding(.horizontal)
            
            
            
            //WIND AND HUMIDITY
            HStack
            {
            
                VStack(alignment: .leading)
                {
                    HStack
                    {
                        Image(systemName: "wind")
                        Text("WIND")
                    }
                    .foregroundStyle(.white).shadow(radius: 10).font(.system(size: 12)).fontWeight(.medium)
                    Divider()
                    
                    Text(weather.wind.speed.roundDouble() + " m/s")
                        .font(.system(size: 25)).foregroundStyle(.white)
                }
                .accessibilityElement(children: .combine)
                .padding(14)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                .frame(width:170, height:200 )
                .padding(.leading)
                
                VStack(alignment: .leading)
                {
                    HStack
                    {
                        Image(systemName: "humidity")
                        Text("HUMIDITY")
                    }
                    .foregroundStyle(.white).shadow(radius: 10).font(.system(size: 12)).fontWeight(.medium)
                    Divider()
                    Text(weather.main.humidity.roundDouble()+"%")
                        .font(.system(size: 25)).foregroundStyle(.white)
                }
                .accessibilityElement(children: .combine)
                .padding(14)
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
                .frame(width:170, height:200 )
                .padding(.horizontal)
                
            }
            .padding(.horizontal)
            .offset(y: -55)
            
            
            
        }
    }
}


private func currentHour() -> String
{
        let formatter = DateFormatter()
        formatter.dateFormat = "h a"
        
        return formatter.string(from: Date())
}

#Preview
{
    WeatherStructureView(weather: previewWeather)
}
