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
        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .red
        firstViewController.title = "First"
        let firstNavigationController = UINavigationController(rootViewController: firstViewController)
        firstNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        // 创建第二个 ViewController 和 NavigationController
        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .green
        secondViewController.title = "Second"
        let secondNavigationController = UINavigationController(rootViewController: secondViewController)
        secondNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        // 创建第三个 ViewController 和 NavigationController
        let thirdViewController = UIViewController()
        thirdViewController.view.backgroundColor = .blue
        thirdViewController.title = "Third"
        let thirdNavigationController = UINavigationController(rootViewController: thirdViewController)
        thirdNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        
        // 将 NavigationControllers 添加到 TabBarController
        tabBarController.viewControllers = [firstNavigationController, secondNavigationController, thirdNavigationController]
        
        // 设置根视图控制器
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        print("app start up")
        return true
    }

}

