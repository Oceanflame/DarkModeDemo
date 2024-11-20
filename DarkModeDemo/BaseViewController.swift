//
//  BaseViewController.swift
//  DarkModeDemo
//
//  Created by 李雨泽 on 2024/11/13.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, ThemeAble {
    
    var colorName: ColorName?
    var titleColorName: ColorName?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ThemeManager.shared.register(self)
        NotificationCenter.default.addObserver(self, selector: #selector(changeTheme), name: .changeThemeNotification, object: nil)
    }
    
    func setViewBackGroundColor(_ color: ColorName) {
        self.colorName = color
        view.backgroundColor = ThemeManager.shared.currentColor(color)
    }
    
    func setTitleColor(_ colorName: ColorName) {
        titleColorName = colorName
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ThemeManager.shared.currentColor(colorName)]
    }
    
    @objc func changeTheme() {
        if let colorName = colorName {
            view.backgroundColor = ThemeManager.shared.currentColor(colorName)
        }
        if let titleColorName = titleColorName {
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ThemeManager.shared.currentColor(titleColorName)]
        }
        let time = Date().timeIntervalSince1970
        ThemeManager.shared.endTime = time > ThemeManager.shared.endTime ? time : ThemeManager.shared.endTime
    }
    
    func applyTheme(completion: (()->Void)?) {
        if let colorName = colorName {
            view.backgroundColor = ThemeManager.shared.currentColor(colorName)
        }
        if let titleColorName = titleColorName {
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ThemeManager.shared.currentColor(titleColorName)]
        }
        completion?()
    }
}
