//
//  ThemeManager.swift
//  DarkModeDemo
//
//  Created by 李雨泽 on 2024/11/13.
//

import UIKit
import Foundation

enum ColorTheme: Int {
    case light = 0
    case dark
}

protocol ThemeAble {
    func applyTheme()
}

class ThemeManager {
    static let shared = ThemeManager()
    private(set) var currentTheme: ColorTheme = .light
    private var themeableViews: NSHashTable<AnyObject> = NSHashTable.weakObjects()
    
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
        for view in themeableViews.allObjects {
            if let themeableView = view as? ThemeAble {
                themeableView.applyTheme()
            }
        }
    }
}
