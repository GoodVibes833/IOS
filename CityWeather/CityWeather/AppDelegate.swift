//
//  AppDelegate.swift
//  CityWeather
//
//  Created by Alex Jintak Han on 2018-10-04.
//  Copyright © 2018 AlexHan. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //frame : size
        window = UIWindow(frame: UIScreen.main.bounds)
        let tabVC = UITabBarController()
        
        window?.rootViewController = tabVC
        
        //5 cities
        let vancouver = City(name:"Vancouver", temp:20, precipitation:95, icon : "canada", summary:"Rainy")
        
        let verona = City(name: "Verona", temp: 22, precipitation: 20, icon: "italy", summary: "Cloudy")
        
        let tokyo = City(name: "Tokyo", temp: 24, precipitation: 40, icon: "japan", summary: "Sunny")
        
        let saoPaulo = City(name: "Sao Paulo", temp: 32, precipitation: 20, icon: "brazil", summary: "Sunny")
        
        let korea = City(name: "korea", temp: 35, precipitation: 50, icon: "skorea", summary: "Sunny")
        

        
        
        let van = CityViewController()
        van.city = vancouver
        van.tabBarItem = UITabBarItem(title: vancouver.name, image: UIImage(named: vancouver.icon), selectedImage: nil)
        let ver = CityViewController()
        ver.city = verona
        ver.tabBarItem = UITabBarItem(title: verona.name, image: UIImage(named: verona.icon), selectedImage: nil)
        let tok = CityViewController()
        tok.city = tokyo
        tok.tabBarItem = UITabBarItem(title: tokyo.name, image: UIImage(named: tokyo.icon), selectedImage: nil)
        let sp = CityViewController()
        sp.city = saoPaulo
        sp.tabBarItem = UITabBarItem(title: saoPaulo.name, image: UIImage(named: saoPaulo.icon), selectedImage: nil)
        let bang = CityViewController()
        bang.city = korea
        bang.tabBarItem = UITabBarItem(title: korea.name, image: UIImage(named: korea.icon), selectedImage: nil)
        
        
        let cities = [van, ver, tok, sp, bang]
        
        let embeded = cities.map{
            UINavigationController(rootViewController: $0)
            //$0 : viewcontroller
        }
        
        tabVC.viewControllers = embeded
        window?.makeKeyAndVisible()
    
    
        
        return true
    }
    


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

