//
//  PopularTableViewController.swift
//  DesignDemo1
//
//  Created by Rohit Gurnani on 18/10/15.
//  Copyright © 2015 Rohit Gurnani. All rights reserved.
//

import UIKit

class PopularTableViewController: UITableViewController {
    var places = placeData
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(1.0, animations: {
            
           
            }, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: CGFloat(Double(0x04)/255), green: CGFloat(Double(0x3D)/255), blue: CGFloat(Double(0x51)/255), alpha: 1.0)
        
      //  UIStatusBarStyle.
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PopularCell", forIndexPath: indexPath) as! PopularCell
        cell.place = placeData[indexPath.row]
        //animation
//        cell.center.y -= self.view.frame.height
//        UIView.animateWithDuration(0.5, delay: 0.3, options: [], animations: {
//            cell.center.y += self.view.bounds.height
//            }, completion: nil)
        //animation
        
        
                return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let optionMenu = UIAlertController(title: nil, message: "So is \(placeData[indexPath.row].name) your selcted City ? ", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        let shareHandler = {
            (action : UIAlertAction)-> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "This service will be available in a further update", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alertMessage.addAction(okAction)
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        
        let shareaction = UIAlertAction(title: "Share", style: UIAlertActionStyle.Default, handler: shareHandler)
        
        let isVisitedAction = UIAlertAction(title: "Have you visited this place ?", style: UIAlertActionStyle.Default, handler: {
            (action : UIAlertAction)->Void in
            
            placeData[indexPath.row].noOfVisitors++
            (tableView.cellForRowAtIndexPath(indexPath) as! PopularCell).place = placeData[indexPath.row]
            
        })
        
        optionMenu.addAction(isVisitedAction)
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(shareaction)
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let wishlistAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Add to\n WishList", handler: {
            (action:UITableViewRowAction , indexPath : NSIndexPath)->Void in
            let wishlistAlert = UIAlertController(title: "Added To Wishlist", message: "\(placeData[indexPath.row].name) has been added to your wishlist", preferredStyle: UIAlertControllerStyle.Alert)
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            wishlistAlert.addAction(okAction)
            self.presentViewController(wishlistAlert, animated: true, completion: nil)
        })
        
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: {
            (action: UITableViewRowAction, indexPath : NSIndexPath)->Void in
            placeData.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
        })
        
        wishlistAction.backgroundColor = UIColor.clearColor()
        return [wishlistAction, deleteAction]
    }
    
   
}
