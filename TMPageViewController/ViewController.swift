//
//  ViewController.swift
//  TMPageViewController
//
//  Created by Travis Ma on 8/1/16.
//  Copyright © 2016 Travis Ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelPageViews: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelPageViews.text = "\(Int(stepper.value))"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seguePageFlip" {
            let vc = segue.destination as! PageViewController
            vc.pages = Int(stepper.value)
            return
        }
        if segue.identifier == "segueContainerView" {
            let vc = segue.destination as! ContainerViewController
            vc.pageCount = Int(stepper.value)
            return
        }
    }
    
    @IBAction func stepperTap(_ sender: UIStepper) {
        labelPageViews.text = "\(Int(stepper.value))"
    }
}

