//
//  ViewController.swift
//  MyConfig
//
//  Created by Bryan Hanson on 9/20/14.
//  Copyright (c) 2014 Bryan Hanson. All rights reserved.
//

import UIKit

// From http://stackoverflow.com/a/24085837/633251
extension CGRect {
    var wh: (w: CGFloat, h: CGFloat) {
        return (size.width, size.height)
    }
}

class ViewController: UIViewController {

    // Main Controller
    
    let button1 = UIButton.buttonWithType(UIButtonType.System) as UIButton
    let button2 = UIButton.buttonWithType(UIButtonType.System) as UIButton
    let label1 = UILabel() as UILabel
    let (width, height) = UIScreen.mainScreen().bounds.wh
    
    func layoutButtons(){
        
        // Layout Buttons and Label in upper portion of device
        
        // Buttons to select hardware or software
        
        button1.setTranslatesAutoresizingMaskIntoConstraints(false)
        button1.setTitle("Software", forState: UIControlState.Normal)
        button1.addTarget(self, action: "showSoft", forControlEvents: UIControlEvents.TouchUpInside)
//        button1.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
        button1.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)

        button2.setTranslatesAutoresizingMaskIntoConstraints(false)
        button2.setTitle("Hardware", forState: UIControlState.Normal)
        button2.addTarget(self, action: "showHard", forControlEvents: UIControlEvents.TouchUpInside)
//        button2.backgroundColor = UIColor.blueColor()
        button2.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)

        // A label giving instructions

        label1.text = "Click a button see device configuration"
        label1.setTranslatesAutoresizingMaskIntoConstraints(false)

        // Add the views
        
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(label1)
        
        // Set up constraints
        
        // Dictionaries make all this accessible
        
        let viewsDictionary = ["button1": button1, "button2": button2, "label1": label1]
//        let metricsDictionary = [
//            "width": width,
//            "height": height,
//            "lab1H": width*0.5,
//            "lab1V": height*0.1
//            ]
        
        // Sizing constraints
        // Buttons and Labels have instrinsic sizes so no need to set explicity
        
        // Position constraints

        let label1_H = NSLayoutConstraint(
            item: label1,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0.0)
        
        let label1_V = NSLayoutConstraint(
            item: label1,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 0.15,
            constant: 0)
 
        let button1_H = NSLayoutConstraint(
            item: button1,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: -1*width*0.15)
        
        let button1_V = NSLayoutConstraint(
            item: button1,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 0.25,
            constant: 0)
        
        let button2_H = NSLayoutConstraint(
            item: button2,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: width*0.15)
        
        let button2_V = NSLayoutConstraint(
            item: button2,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 0.25,
            constant: 0)

//        let label1_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("H:|-lab1H-[label1]",
//            options: NSLayoutFormatOptions(0),
//            metrics: metricsDictionary,
//            views: viewsDictionary)
//        
//        let label1_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat("V:|-lab1V-[label1]",
//            options: NSLayoutFormatOptions(0),
//            metrics: metricsDictionary,
//            views: viewsDictionary)
        
        view.addConstraint(label1_H)
        view.addConstraint(label1_V)
        view.addConstraint(button1_H)
        view.addConstraint(button1_V)
        view.addConstraint(button2_H)
        view.addConstraint(button2_V)

    } // end of layoutButtons

    // Button handlers
    
    func showSoft() {
        pushTextView()
        println("Button 1 (soft) was clicked")
    }
    
    func showHard() {
//        pushTextView()
        println("Button 2 (hard) was clicked")
    }
    
    
    func pushTextView() {

        // When a button is pushed, create a textxtViewiew area
        // for the appropriate info

        // Add layout manager to text storage object
        // Create a text container
        // Add text container to text layout manager
        // Instantiate UITextxtViewiew object using the text container
        // Add text view to the main view of the view controler

        let tmpString = "Hello" // probably this becomes an argument
        let msgString = NSMutableAttributedString(string: tmpString,
            attributes:[
            NSFontAttributeName: UIFont(name:"GillSans", size:20)
            ])
        
        let r = view.bounds

        let txtStore = NSTextStorage()
        let layMan = NSLayoutManager()
        txtStore.addLayoutManager(layMan)
        let txtCon = NSTextContainer(size: r.size)
        layMan.addTextContainer(txtCon)
        let txtView = UITextView(frame:r, textContainer:txtCon)
        txtView.attributedText = msgString
        
        txtView.textColor = UIColor.blackColor()
        txtView.scrollEnabled = true
        txtView.backgroundColor = UIColor.whiteColor()
        let inset = 0.05 * width
        txtView.textContainerInset = UIEdgeInsetsMake(inset, inset, inset, inset)
        txtView.selectable = false
        txtView.editable = false
        
        txtView.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addSubview(txtView)
        let viewsDictionary = ["txtView": txtView]

        let txtView_H = NSLayoutConstraint(
            item: txtView,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0.0)
        
        let txtView_V = NSLayoutConstraint(
            item: txtView,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 0.75,
            constant: 0)

        view.addConstraint(txtView_H)
        view.addConstraint(txtView_V)
        
    } // end of pushTextView
    
    // Set up handling orientations
    // How to set the orientation. The return value is not what we expect, Int not UInt so we cast.

    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.All.toRaw())
    }

    // Required Apple Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        view.backgroundColor = UIColor.yellowColor()
        println("Device width is \(width)")
        println("Device height is \(height)")
        layoutButtons()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

} // end of ViewController

