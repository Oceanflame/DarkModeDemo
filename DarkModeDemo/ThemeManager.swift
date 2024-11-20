//
//  ThemeManager.swift
//  DarkModeDemo
//
//  Created by 李雨泽 on 2024/11/13.
//

import UIKit
import Foundation

extension Notification.Name {
    static let changeThemeNotification = Notification.Name("myCustomNotification")
}

enum ColorTheme: Int {
    case light = 0
    case dark
}

protocol ThemeAble {
    func applyTheme(completion: (()->Void)?)
}

class ThemeManager {
    static let shared = ThemeManager()
    private(set) var currentTheme: ColorTheme = .light
    private var themeableViews: NSHashTable<AnyObject> = NSHashTable.weakObjects()
    
    var startTime: TimeInterval = 0
    var endTime: TimeInterval = 0
    
    let lightColors: [ColorName: UIColor] = [.black_mainFont: P3.HEX(0x141414),
                                             .white_bg: P3.HEX(0xFFFFFF)]
    
    let darkColors: [ColorName: UIColor] = [.black_mainFont: P3.HEX(0xFFFFFF),
                                            .white_bg: P3.HEX(0x141414)]
    
    func currentColor(_ colorName: ColorName) -> UIColor {
        switch currentTheme {
        case .light:
            return lightColors[colorName]!
        case .dark:
            return darkColors[colorName]!
        }
    }

    func register(_ view: AnyObject) {
        themeableViews.add(view)
    }

    func applyTheme(_ theme: ColorTheme) {
        currentTheme = theme
        print("上次更换主题耗时 \(endTime - startTime)，view数:\(themeableViews.count)")
        startTime = Date().timeIntervalSince1970
        for view in themeableViews.allObjects {
            if let themeableView = view as? ThemeAble {
                themeableView.applyTheme { [weak self] in
                    guard let self = self else { return }
                    let time = Date().timeIntervalSince1970
                    endTime = time > endTime ? time : endTime
                }
            }
        }
        
//        NotificationCenter.default.post(name: .changeThemeNotification, object: nil, userInfo: nil)
    }
}
