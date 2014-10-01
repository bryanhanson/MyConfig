//
//  ViewController.swift
//  MyConfig
//
//  Created by Bryan Hanson on 9/20/14.
//

import UIKit

class ViewController: UIViewController {


    // Constants local to view controller
    
    let width = UIScreen.mainScreen().bounds.size.width
    let height = UIScreen.mainScreen().bounds.size.height
    
    // Constants local to view controller
    // These also create view objects
    
    let button1 = UIButton.buttonWithType(UIButtonType.System) as UIButton
    let button2 = UIButton.buttonWithType(UIButtonType.System) as UIButton
    let label1 = UILabel() as UILabel

    // Variables local to view controller
    // Create a totally generic text view

    var txtView = UITextView(frame:CGRect(), textContainer:NSTextContainer?())
    
    // Everything below here is a function

    // This next function makes everything happen!!!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellowColor()
        layoutButtons()
        layoutTextView()
        pushText("Click a button to see the details of the device configuration.")
        
    }

    func layoutButtons(){
        
        // Layout Buttons and Label in upper portion of device
        
        // Configure buttons to select hardware or software
        
        button1.setTitle("Software", forState: UIControlState.Normal)
        button1.addTarget(self, action: "showSoft", forControlEvents: UIControlEvents.TouchUpInside)
        button1.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)

        button2.setTitle("Hardware", forState: UIControlState.Normal)
        button2.addTarget(self, action: "showHard", forControlEvents: UIControlEvents.TouchUpInside)
        button2.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)

        // Configure label giving instructions

        label1.text = "Click a button see device configuration"

        // Add the views
        
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(label1)
        
        // Create constraints
        
        // Dictionaries make all this accessible
        
        let viewsDictionary = ["button1": button1, "button2": button2, "label1": label1]
        
        // Size constraints
        // Buttons and Labels have instrinsic sizes so no need to set explicity
        
        // Position constraints

        let label1_Hpos = NSLayoutConstraint(
            item: label1,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0.0)
        
        let label1_Vpos = NSLayoutConstraint(
            item: label1,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 0.15,
            constant: 0)
 
        let button1_Hpos = NSLayoutConstraint(
            item: button1,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: -1*width*0.15)
        
        let button1_Vpos = NSLayoutConstraint(
            item: button1,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 0.25,
            constant: 0)
        
        let button2_Hpos = NSLayoutConstraint(
            item: button2,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: width*0.15)
        
        let button2_Vpos = NSLayoutConstraint(
            item: button2,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 0.25,
            constant: 0)

        // Turn off autolayout
        
        button1.setTranslatesAutoresizingMaskIntoConstraints(false)
        button2.setTranslatesAutoresizingMaskIntoConstraints(false)
        label1.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // Add the constraints
        
        view.addConstraint(label1_Hpos)
        view.addConstraint(label1_Vpos)
        view.addConstraint(button1_Hpos)
        view.addConstraint(button1_Vpos)
        view.addConstraint(button2_Hpos)
        view.addConstraint(button2_Vpos)

    } // End of layoutButtons

    func layoutTextView(){
        
        // Layout a region in which to report the device configuration
        // See layoutButtons for additional comments
        
        txtView.textColor = UIColor.blackColor()
        txtView.backgroundColor = UIColor.greenColor()
        txtView.scrollEnabled = true
        txtView.editable = false

        // Add the view, create constraints, make it so
        
        view.addSubview(txtView)
        let viewsDictionary = ["txtView": txtView]
        
        let tv_Hpos = NSLayoutConstraint(
            item: txtView,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1.0,
            constant: 0.0)
        
        let tv_Vpos = NSLayoutConstraint(
            item: txtView,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1.0,
            constant: 0.0)

        let tv_Hsize = NSLayoutConstraint(
            item: txtView,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: 0.9,
            constant: 0.0)

        let tv_Vsize = NSLayoutConstraint(
            item: txtView,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Height,
            multiplier:0.65,
            constant: 0.0)


        txtView.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addConstraint(tv_Hpos)
        view.addConstraint(tv_Vpos)
        view.addConstraint(tv_Hsize)
        view.addConstraint(tv_Vsize)
        
    } // end of layoutTextView

    // Button handlers
    
    func showSoft() {
        pushText("You old softy!")
//        println("Button 1 (software) was clicked")
    }
    
    func showHard() {
        pushText("You are an iron man!")
//        println("Button 2 (hardware) was clicked")
    }
    
    func pushText(theString: String) {

        var msgString = NSMutableString(string: theString)
        txtView.text = msgString
        
    } // end of pushText
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

} // end of ViewController

