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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ThemeManager.shared.register(self)
    }
    
    func setViewBackGroundColor(_ color: ColorName) {
        self.colorName = color
        view.backgroundColor = ThemeManager.shared.currentColor(color)
    }
    
    func applyTheme() {
        if let colorName = colorName {
            view.backgroundColor = ThemeManager.shared.currentColor(colorName)
        }
    }
}
