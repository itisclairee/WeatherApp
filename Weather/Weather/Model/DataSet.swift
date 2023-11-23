//
//  DataSet.swift
//  Weather
//
//  Created by Chiara Cangelosi on 20/11/23.
//

import Foundation
import SwiftUI

struct HourlyForecast: Identifiable
{
    var id: UUID = UUID()
    var time: String
    var image: String
    var temperature: Int
}

struct DaysForecast: Identifiable
{
    var id: UUID = UUID()
    var day: String
    var image: String
    var minTemp: Int
    var maxTemp: Int
}


var hourly: [HourlyForecast]  =
[
    HourlyForecast(time: "12:00", image: "wind", temperature: 19),
    HourlyForecast(time: "13:00", image: "wind", temperature: 19),
    HourlyForecast(time: "14:00", image: "wind", temperature: 19),
    HourlyForecast(time: "15:00", image: "wind", temperature: 19),
    HourlyForecast(time: "16:00", image: "wind", temperature: 18),
    HourlyForecast(time: "17:00", image: "wind", temperature: 18),
    HourlyForecast(time: "18:00", image: "wind", temperature: 17),
    HourlyForecast(time: "19:00", image: "wind", temperature: 17),
    HourlyForecast(time: "20:00", image: "wind", temperature: 17)
]

var daily : [DaysForecast] =
[
    DaysForecast(day: "Thursday", image: "cloud.fill", minTemp: 11, maxTemp: 18),
    DaysForecast(day: "Friday", image: "cloud.fill", minTemp: 12, maxTemp: 17),
    DaysForecast(day: "Saturday", image: "cloud.fill", minTemp: 9, maxTemp: 15),
    DaysForecast(day: "Sunday", image: "cloud.fill", minTemp: 13, maxTemp: 19),
    DaysForecast(day: "Monday", image: "cloud.fill", minTemp: 12, maxTemp: 18),
]




