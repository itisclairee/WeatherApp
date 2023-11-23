//
//  WeatherView.swift
//  Weather
//
//  Created by Chiara Cangelosi on 16/11/23.
//

import SwiftUI
import SpriteKit

struct WeatherView: View 
{
    var weather: ResponseBody?
    
    var body: some View
    {
        ZStack
        {
            if(weather?.weather[0].main == "Clouds")
            {
                ZStack
                {
                    Image("cloud").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
                }
            }
            else
            if (weather?.weather[0].main == "Rain" || weather?.weather[0].main == "Drizzle")
            {
                Image("darkcloud").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
                SpriteView(scene: RainScene(),
                           options: [.allowsTransparency]).ignoresSafeArea()
            
            }
            else
            if(weather?.weather[0].main == "Clear")
            {
                Image("clear").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea()
            }
            
            
            
            ScrollView
            {
                WeatherStructureView(weather: weather!).frame(maxWidth: 400)
            }
            
            
        }
    }
}
            
        
class RainScene: SKScene
{
    override func sceneDidLoad()
    {
        backgroundColor = .clear
        
        size = UIScreen.main.bounds.size
        scaleMode = .resizeFill
        
        anchorPoint = CGPoint(x: 0.5, y:1)
        
        let rainEmitter = SKEmitterNode(fileNamed: "Rain.sks")!
        
        addChild(rainEmitter)
        
        rainEmitter.particlePositionRange.dx = UIScreen.main.bounds.width
        
    }

}





//in order to work, the preview needs a weather variable
#Preview 
{
    WeatherView(weather: previewWeather)
}
 
