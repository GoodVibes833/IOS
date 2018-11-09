//
//  PageViewController.swift
//  AVStoryBookAssignment
//
//  Created by Alex Jintak Han on 2018-11-01.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit
import CoreData

class PageViewController: UIPageViewController {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var pages = [Page]()
    private var pageCollection = [StoryViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
    
        setUp()
        
        let request: NSFetchRequest<Page> = Page.fetchRequest()
        do{
            pages = try context.fetch(request)
        }catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
        if pages.count == 0{
            let storyVC = storyboard?.instantiateViewController(withIdentifier: "storyVC") as! StoryViewController
            
            storyVC.view.backgroundColor = .red
            storyVC.delegate = self
            pageCollection.append(storyVC)
        }else{
            setUp()
        }
        setViewControllers([pageCollection[0]], direction: .forward, animated: true, completion: nil)

    }

    fileprivate func setUp() {
        
        if pages.count > 0{
            for i in 0..<pages.count{
                let storyVC = storyboard?.instantiateViewController(withIdentifier: "storyVC") as! StoryViewController
                storyVC.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                storyVC.delegate = self
                storyVC.page = pages[i]
                pageCollection.append(storyVC)
            }
        }
        

        
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

extension PageViewController:AddStoryViewControllerDelegate{
    func addStoryViewController() {
        let storyVC = storyboard?.instantiateViewController(withIdentifier: "storyVC") as! StoryViewController
        
        storyVC.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        storyVC.delegate = self
        pageCollection.append(storyVC)
    }
        
}
