//
//  UIColor+Helper.swift
//  DarkModeDemo
//
//  Created by 李雨泽 on 2024/11/13.
//

import UIKit
import Foundation

enum ColorName: String {
    case black_mainFont = "black_mainFont"
    case white_bg = "white_bg"
}

extension UIColor {
    class func color(withHex hex: Int, alpha: CGFloat, displayP3: Bool = false) -> UIColor {
        let r: Int = (hex >> 16) & 255
        let g: Int = (hex >> 8) & 255
        let b: Int = hex & 255
        let rf = Float(r) / 255.0
        let gf = Float(g) / 255.0
        let bf = Float(b) / 255.0
        
        if displayP3 {
             return UIColor(displayP3Red: CGFloat(rf), green: CGFloat(gf), blue: CGFloat(bf), alpha: alpha)
        } else {
            return UIColor(red: CGFloat(rf), green: CGFloat(gf), blue: CGFloat(bf), alpha: alpha)
        }
    }
    enum P3 {
        static func HEX(_ hex: Int, alpha: CGFloat = 1) -> UIColor {
            return UIColor.color(withHex: hex, alpha: alpha, displayP3: true)
        }
    }
    
    static var black_mainFont: UIColor { themeColor(colorsTuple: (P3.HEX(0x141414),
                                                                  P3.HEX(0xFFFFFF))) }
    
    static var white_bg: UIColor { themeColor(colorsTuple: (P3.HEX(0xFFFFFF),
                                                            P3.HEX(0x000000))) }
    
    static func themeColor(colorsTuple: (light: UIColor, dark: UIColor), colorName: ColorName) -> UIColor {
        var color = UIColor()
        switch ThemeManager.shared.currentTheme {
        case .light:
            color = colorsTuple.light
        case .dark:
            color = colorsTuple.dark
        }
        color.
    }
}


extension UIView {
    func allSubviews() -> [UIView] {
        var allSubviews = [UIView]()
        
        func getSubviews(view: UIView) {
            allSubviews.append(view)
            for subview in view.subviews {
                getSubviews(view: subview)
            }
        }
        
        getSubviews(view: self)
        return allSubviews
    }
}
