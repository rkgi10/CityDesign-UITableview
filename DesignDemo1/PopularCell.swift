//
//  CityTableViewCell.swift
//  DesignDemo1
//
//  Created by Rohit Gurnani on 18/10/15.
//  Copyright © 2015 Rohit Gurnani. All rights reserved.
//

import UIKit

class PopularCell: UITableViewCell {
    @IBOutlet weak var likesLabel : UILabel!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var visitorLabel : UILabel!
    @IBOutlet weak var cellImageView : UIImageView!
    @IBOutlet weak var viewBehindVisitors : UIView!
    
   
    
    var place : Place! {
        didSet {
            likesLabel.text = "❤︎ "+String(place.likes)
            nameLabel.text = (place.name).uppercaseString
            visitorLabel.text = String(place.noOfVisitors)+" Visitors"
            
            let cellColor = UIColor(red: CGFloat(place.backgroundColorRed/255), green: CGFloat(place.backgroundColorGreen/255), blue: CGFloat(place.backgroundColorBlue/255), alpha: 1.0)
            
            let cellImage = UIImage(named: place.name)
            cellImageView.image = cellImage
            cellImageView.alpha = 0.400
            
                        
             viewBehindVisitors?.backgroundColor = cellColor
            
            viewBehindVisitors?.frame.size.width = visitorLabel.frame.width + 5.0
            viewBehindVisitors?.layer.cornerRadius = (viewBehindVisitors?.frame.height)!/2.0
            self.backgroundColor = cellColor
           
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
