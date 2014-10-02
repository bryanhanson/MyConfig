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
        // Here an in layoutTextView everything is positioned
        // as a fraction of the width or height
        
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

        let offset = 0.1*width

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
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: offset)
 
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
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: offset*2)
        
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
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: 2.0*offset)

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
        let offset = 0.1*width
        
        let tv_left = NSLayoutConstraint(
            item: txtView,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1.0,
            constant: offset)

        let tv_right = NSLayoutConstraint(
            item: txtView,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1.0,
            constant: -1.0*offset)

        let tv_top = NSLayoutConstraint(
            item: txtView,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1.0,
            constant: offset*3)
        
        let tv_bottom = NSLayoutConstraint(
            item: txtView,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1.0,
            constant: -1.0*offset)

        txtView.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.addConstraint(tv_left)
        view.addConstraint(tv_right)
        view.addConstraint(tv_top)
        view.addConstraint(tv_bottom)
        
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

