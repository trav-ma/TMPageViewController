//
//  ContentViewController.swift
//  PageViewController
//
//  Created by Travis Ma on 9/24/15.
//  Copyright © 2015 Travis Ma. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    var views = [UIViewController]()
    var pages: Int = 2
    var pageViewController: UIPageViewController?
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<pages {
            if let vc = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as? PageContentViewController {
                vc.index = i
                views.append(vc)
            }
        }
        pageViewController = self.childViewControllers[0] as? UIPageViewController
        pageViewController!.delegate = self
        pageViewController!.dataSource = self
        pageViewController!.setViewControllers([views[0]], direction: .Forward, animated: true, completion: nil)
        pageControl.numberOfPages = pages
    }

    @IBAction func pageControlValueChanged(sender: UIPageControl) {
        if sender.currentPage > currentIndex {
            pageViewController!.setViewControllers([views[sender.currentPage]], direction: .Forward, animated: true, completion: nil)
        } else {
            pageViewController!.setViewControllers([views[sender.currentPage]], direction: .Reverse, animated: true, completion: nil)
        }
        currentIndex = sender.currentPage
    }
}

extension ContainerViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
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
    
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        let vc = pendingViewControllers[0] as! PageContentViewController
        pageControl.currentPage = vc.index
        currentIndex = vc.index
    }
    
}