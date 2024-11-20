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

enum P3 {
    static func HEX(_ hex: Int, alpha: CGFloat = 1) -> UIColor {
        return UIColor.color(withHex: hex, alpha: alpha, displayP3: true)
    }
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
    
    static var black_mainFont: UIColor { ThemeManager.shared.currentColor(.black_mainFont) }
    
    static var white_bg: UIColor { ThemeManager.shared.currentColor(.white_bg) }
    
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

class BaseUILabel: UILabel, ThemeAble {
    func applyTheme(completion: (() -> Void)?) {
        if let colorName = colorName {
            textColor = ThemeManager.shared.currentColor(colorName)
            completion?()
        }
    }
    
    var colorName: ColorName?
    
    func setTextColor(_ colorName: ColorName) {
        self.colorName = colorName
        textColor = ThemeManager.shared.currentColor(colorName)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        ThemeManager.shared.register(self)
        NotificationCenter.default.addObserver(self, selector: #selector(changeTheme), name: .changeThemeNotification, object: nil)
    }
    
    @objc func changeTheme() {
        if let colorName = colorName {
            textColor = ThemeManager.shared.currentColor(colorName)
        }
        let time = Date().timeIntervalSince1970
        ThemeManager.shared.endTime = time > ThemeManager.shared.endTime ? time : ThemeManager.shared.endTime
    }
}

class BaseUIButton: UIButton, ThemeAble {
    func applyTheme(completion: (() -> Void)?) {
        if let colorName = colorName {
            setTitleColor(ThemeManager.shared.currentColor(colorName), for: .normal)
            completion?()
        }
    }
    
    var colorName: ColorName?
    
    func setTitleColor(_ colorName: ColorName, _ state: UIControl.State) {
        self.colorName = colorName
        setTitleColor(ThemeManager.shared.currentColor(colorName), for: state)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        ThemeManager.shared.register(self)
        NotificationCenter.default.addObserver(self, selector: #selector(changeTheme), name: .changeThemeNotification, object: nil)
    }
    
    @objc func changeTheme() {
        if let colorName = colorName {
            setTitleColor(ThemeManager.shared.currentColor(colorName), for: .normal)
        }
        let time = Date().timeIntervalSince1970
        ThemeManager.shared.endTime = time > ThemeManager.shared.endTime ? time : ThemeManager.shared.endTime
    }
}

