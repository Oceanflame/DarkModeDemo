//
//  AppDelegate.swift
//  DarkModeDemo
//
//  Created by 李雨泽 on 2024/11/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 创建 UIWindow 实例
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // 创建 TabBarController
        let tabBarController = UITabBarController()
        
        // 创建第一个 ViewController 和 NavigationController
        let firstViewController = FirstViewController()
        firstViewController.title = "First"
        let firstNavigationController = UINavigationController(rootViewController: firstViewController)
        firstNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        // 创建第二个 ViewController 和 NavigationController
        let secondViewController = SecondViewController()
        secondViewController.title = "Second"
        let secondNavigationController = UINavigationController(rootViewController: secondViewController)
        secondNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        let thirdViewController = ThirdViewController()
        thirdViewController.title = "Third"
        let thirdNavController = UINavigationController(rootViewController: thirdViewController)
        thirdNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 2)
        
        // 将 NavigationControllers 添加到 TabBarController
        tabBarController.viewControllers = [firstNavigationController, secondNavigationController, thirdNavController]
        
        // 设置根视图控制器
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        print("app start up")
        return true
    }

}

