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
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "PageContentViewController") as? PageContentViewController {
                vc.index = i
                views.append(vc)
            }
        }
        self.setViewControllers([views[0]], direction: .forward , animated: false, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! PageContentViewController
        let idx = vc.index + 1
        return idx < views.count ? views[idx] : nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! PageContentViewController
        let idx = vc.index - 1
        return idx >= 0 ? views[idx] : nil
    }
    
    //to hide the page control that's automatically created by UIPageViewController, comment out the 2 below functions
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return views.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
