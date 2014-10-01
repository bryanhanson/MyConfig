//
//  ViewController.swift
//  MyConfig
//
//  Created by Bryan Hanson on 9/20/14.
//

import UIKit

class ViewController: UIViewController {


    // variables local to view controller
    
    let button1 = UIButton.buttonWithType(UIButtonType.System) as UIButton
    let button2 = UIButton.buttonWithType(UIButtonType.System) as UIButton
    let label1 = UILabel() as UILabel
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height
//    var txtView: UITextView!
    
    func layoutButtons(){
        
        // Layout Buttons and Label in upper portion of device
        
        // Buttons to select hardware or software
        
        button1.setTranslatesAutoresizingMaskIntoConstraints(false)
        button1.setTitle("Software", forState: UIControlState.Normal)
        button1.addTarget(self, action: "showSoft", forControlEvents: UIControlEvents.TouchUpInside)
        button1.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)

        button2.setTranslatesAutoresizingMaskIntoConstraints(false)
        button2.setTitle("Hardware", forState: UIControlState.Normal)
        button2.addTarget(self, action: "showHard", forControlEvents: UIControlEvents.TouchUpInside)
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

        view.addConstraint(label1_H)
        view.addConstraint(label1_V)
        view.addConstraint(button1_H)
        view.addConstraint(button1_V)
        view.addConstraint(button2_H)
        view.addConstraint(button2_V)

    } // end of layoutButtons

    // Button handlers
    
    func showSoft() {
        pushTextView("You old softy!")
        println("Button 1 (software) was clicked")
    }
    
    func showHard() {
        pushTextView("You are an iron man!")
        println("Button 2 (hardware) was clicked")
    }
    
    
    func pushTextView(theString: String) {

        let msgString = NSMutableString(string: theString)
        
        let tvh = height - (height*0.15) - (width*0.05)
        let tv = CGRect(x: width*0.05, y: height*0.15, width: width*0.9, height: tvh)
        let txtStore = NSTextStorage()
        let layMan = NSLayoutManager()
        let txtCon = NSTextContainer(size: tv.size)
        var txtView = UITextView(frame:tv, textContainer:txtCon)

        layMan.addTextContainer(txtCon)
        txtStore.addLayoutManager(layMan)
        
        txtView.text = msgString
        txtView.textColor = UIColor.blackColor()
        txtView.scrollEnabled = true
        txtView.backgroundColor = UIColor.greenColor()
        self.view.addSubview(txtView)

    } // end of pushTextView
    
    // Set up handling orientations
    // How to set the orientation. The return value is not what we expect, Int not UInt so we cast.

    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.All.toRaw())
    }

    // Required Apple Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellowColor()
        println("Device width is \(width)")
        println("Device height is \(height)")
        layoutButtons()
        pushTextView("Click a button to see the details of the device configuration.")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

} // end of ViewController

