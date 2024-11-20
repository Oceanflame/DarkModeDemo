//
//  UIImage+Helper.swift
//  DarkModeDemo
//
//  Created by 李雨泽 on 2024/11/19.
//

import UIKit
import Foundation

extension UIImage {
    func imageName(_ name: String) -> String {
        switch ThemeManager.shared.currentTheme {
        case .light:
            return name
        case .dark:
            return "\(name)_dark"
        }
    }
}

class BaseView: UIView, ThemeAble {
    func applyTheme(completion: (() -> Void)?) {
        if let colorName = colorName {
            self.backgroundColor = ThemeManager.shared.currentColor(colorName)
            completion?()
        }
    }
    
    var colorName: ColorName?
    
    func setBackGroundColor(_ colorName: ColorName) {
        self.colorName = colorName
        self.backgroundColor = ThemeManager.shared.currentColor(colorName)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        ThemeManager.shared.register(self)
        NotificationCenter.default.addObserver(self, selector: #selector(changeTheme), name: .changeThemeNotification, object: nil)
    }
    
    @objc func changeTheme() {
        if let colorName = colorName {
            self.backgroundColor = ThemeManager.shared.currentColor(colorName)
        }
        let time = Date().timeIntervalSince1970
        ThemeManager.shared.endTime = time > ThemeManager.shared.endTime ? time : ThemeManager.shared.endTime
    }
}

class BaseImageView: UIImageView, ThemeAble {
    func applyTheme(completion: (() -> Void)?) {
        if let assetName = assetName {
            self.image = UIImage(named: ThemeManager.shared.currentTheme == .light ? assetName : "\(assetName)_dark")
        }
        completion?()
    }
    
    var assetName: String?
    
    init(imageName: String) {
        assetName = imageName
        super.init(image: UIImage(named: ThemeManager.shared.currentTheme == .light ? imageName : "\(imageName)_dark"))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        ThemeManager.shared.register(self)
        NotificationCenter.default.addObserver(self, selector: #selector(changeTheme), name: .changeThemeNotification, object: nil)
    }
    
    @objc func changeTheme() {
        if let assetName = assetName {
            self.image = UIImage(named: ThemeManager.shared.currentTheme == .light ? assetName : "\(assetName)_dark")
        }
        let time = Date().timeIntervalSince1970
        ThemeManager.shared.endTime = time > ThemeManager.shared.endTime ? time : ThemeManager.shared.endTime
    }
}
