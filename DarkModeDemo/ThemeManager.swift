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

class ThemeManager {
    static let shared = ThemeManager()
    private(set) var currentTheme: ColorTheme = .light
    private var themeableViews: NSHashTable<AnyObject> = NSHashTable.weakObjects()

    func register(_ view: UIView) {
        themeableViews.add(view)
    }

    func applyTheme(_ theme: ColorTheme) {
        currentTheme = theme
        for view in themeableViews.allObjects {
            if let label = view as? UILabel {
                label.textColor = label.textColor
            } else if let button = view as? UIButton {
                if let color = button.titleLabel?.textColor {
                    button.setTitleColor(color, for: .normal)
                }
            }
        }
    }
}
