 //
//  Extension.swift
//  Weather
//
//  Created by Chiara Cangelosi on 16/11/23.
//

import Foundation
import SwiftUI

//the data the we will fetch in the open API will return us double, so we need to tound doubles into decimal
extension Double
{
    func roundDouble() -> String
    {
       return String(format: "%.0f", self)
    }
}

// Extension for adding rounded corners to specific corners
extension View 
{
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View 
    {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape 
{
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path 
    {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension UIScreen 
{
static let screenWidth = UIScreen.main.bounds.size.width
static let screenHeight = UIScreen.main.bounds.size.height
static let screenSize = UIScreen.main.bounds.size
}
