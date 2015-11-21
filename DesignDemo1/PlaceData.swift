//
//  PlaceData.swift
//  DesignDemo1
//
//  Created by Rohit Gurnani on 18/10/15.
//  Copyright © 2015 Rohit Gurnani. All rights reserved.
//

import Foundation
struct Place
{
    var name : String
    var noOfVisitors : Int
    var likes : Int
    var backgroundImage : String?
    var backgroundColorRed : Double!
    var backgroundColorGreen : Double!
    var backgroundColorBlue : Double!
    
    init(name: String, visitors: Int, likes : Int, red:Double, green:Double, blue:Double)
    {
        self.name = name
        self.noOfVisitors = visitors
        self.likes = likes
        self.backgroundColorRed = red
        self.backgroundColorGreen = green
        self.backgroundColorBlue = blue
    }
}