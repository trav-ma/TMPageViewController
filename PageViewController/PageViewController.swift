//
//  PageViewController.swift
//  PageViewController
//
//  Created by Travis Ma on 9/24/15.
//  Copyright © 2015 Travis Ma. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    var pages: Int = 2
    var views = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        for i in 0..<pages {
            if let vc = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as? PageContentViewController {
                vc.index = i
                views.append(vc)
            }
        }
        self.setViewControllers([views[0]], direction: .Forward , animated: false, completion: nil)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! PageContentViewController
        let idx = vc.index + 1
        if idx < views.count {
            return views[idx]
        } else {
            return nil
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! PageContentViewController
        let idx = vc.index - 1
        if idx >= 0 {
            return views[idx]
        } else {
            return nil
        }
    }
    
    //to hide the page control that's automatically created by UIPageViewController, comment out the below functions
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return views.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
