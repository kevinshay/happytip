//
//  ViewController.swift
//  tips
//
//  Created by Kevin Shay on 1/4/15.
//  Copyright (c) 2015 Kevin Shay. All rights reserved.
//

import UIKit

// we are a text field delegate because we want to be able to be 
// notififed when someone starts typing
class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var faceImageview: UIImageView!
    
    // the constraint that controls the vertial layout of the image
    @IBOutlet weak var faceImageViewConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        // remember to assign ourself as the delegate (self means this view controller)
        billField.delegate = self
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        
        var tipPercentages = [ 0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        let happyFaceimage = UIImage(named: "22face")
        let wowFaceimage = UIImage(named: "18face")
        let ballerFaceimage = UIImage (named: "20face")
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "\(total)"
        
        tipLabel.text = String (format: "$%.2f", tip)
        totalLabel.text = String (format: "$%.2f", total)
        
        switch (tipControl.selectedSegmentIndex) {
        case 0:
            faceImageview.image = happyFaceimage
            break;
        case 1:
            faceImageview.image = wowFaceimage
            break;
        default:
            faceImageview.image = ballerFaceimage
            break;
        }
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        faceImageViewConstraint.constant = 28
        
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        faceImageViewConstraint.constant = -10
    }
    
}

