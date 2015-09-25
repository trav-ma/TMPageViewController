//
//  ViewController.swift
//  PageViewController
//
//  Created by Travis Ma on 9/24/15.
//  Copyright © 2015 Travis Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelPageViews: UILabel!
    @IBOutlet weak var stepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        labelPageViews.text = "\(Int(stepper.value))"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "seguePageFlip" {
            let vc = segue.destinationViewController as! PageViewController
            vc.pages = Int(stepper.value)
            return
        }
        if segue.identifier == "segueContainerView" {
            let vc = segue.destinationViewController as! ContainerViewController
            vc.pages = Int(stepper.value)
            return
        }
    }

    @IBAction func stepperTap(sender: UIStepper) {
        labelPageViews.text = "\(Int(stepper.value))"
    }
}

