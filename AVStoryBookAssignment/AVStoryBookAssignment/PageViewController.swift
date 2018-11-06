//
//  PageViewController.swift
//  AVStoryBookAssignment
//
//  Created by Alex Jintak Han on 2018-11-01.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    private var pageCollection = [StoryViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        setUp()
    }

    fileprivate func setUp() {
        let storyVC1 = storyboard?.instantiateViewController(withIdentifier: "storyVC") as! StoryViewController
        storyVC1.view.backgroundColor = #colorLiteral(red: 0, green: 0.339300932, blue: 0.7068895725, alpha: 1)
        pageCollection.append(storyVC1)
        
        let storyVC2 = storyboard?.instantiateViewController(withIdentifier: "storyVC") as! StoryViewController
        storyVC2.view.backgroundColor = #colorLiteral(red: 1, green: 0.1715849569, blue: 0.2132276923, alpha: 1)
        pageCollection.append(storyVC2)
        
        let storyVC3 = storyboard?.instantiateViewController(withIdentifier: "storyVC") as! StoryViewController
        storyVC3.view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        pageCollection.append(storyVC3)
        
        let storyVC4 = storyboard?.instantiateViewController(withIdentifier: "storyVC") as! StoryViewController
        storyVC4.view.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        pageCollection.append(storyVC4)
        
        setViewControllers([storyVC1], direction: .forward, animated: true, completion: nil)
    }
}


extension PageViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //return the VC that should be placed BEFORE my "current" vc
        guard let index = pageCollection.firstIndex(of: viewController as! StoryViewController)
            else{return nil}
        
        let beforeIndex = index - 1
        if beforeIndex < 0 {
            return nil
        }
        return pageCollection[beforeIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //return the VC that should be placed AFTER my "current" vc
        guard let index = pageCollection.firstIndex(of: viewController as! StoryViewController)
            else{return nil}
        
        let nextIndex = index + 1
        if nextIndex >= pageCollection.count {
            return nil
        }
        return pageCollection[nextIndex]
    
    }
}
