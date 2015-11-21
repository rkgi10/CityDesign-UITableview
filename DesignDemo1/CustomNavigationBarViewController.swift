//
//  CustomNavigationBarViewController.swift
//  DesignDemo1
//
//  Created by Rohit Gurnani on 18/10/15.
//  Copyright © 2015 Rohit Gurnani. All rights reserved.
//

import UIKit

class CustomNavigationBarViewController: UINavigationBar {
    

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        // Drawing code
        
//        let navBarColor = UIColor(red: CGFloat(Double(0x04)/255), green: CGFloat(Double(0x3D)/255), blue: CGFloat(Double(0x51)/255), alpha: 1.0)
//       // self.backgroundColor = navBarColor
//        self.barTintColor = navBarColor
        if let barFont = UIFont(name: "AvenirNextCondensed-DemiBold", size: 22.0) {
            self.titleTextAttributes =
            [NSForegroundColorAttributeName:UIColor.whiteColor(), NSFontAttributeName:barFont]
        }

//        self.titleTextAttributes = [NSForegroundColorAttributeName :UIColor.whiteColor() , NSTextEffectAttributeName : NSTextEffectLetterpressStyle,
//            NSFontAttributeName : barFont]
    }
    

}
