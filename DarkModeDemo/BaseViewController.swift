//
//  BaseViewController.swift
//  DarkModeDemo
//
//  Created by 李雨泽 on 2024/11/13.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        ThemeManager.shared.register(self.view)
        for subview in view.allSubviews() {
            ThemeManager.shared.register(subview)
            print("添加 view")
        }
    }
}
