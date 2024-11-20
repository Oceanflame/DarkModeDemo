//
//  ThirdViewController.swift
//  DarkModeDemo
//
//  Created by 李雨泽 on 2024/11/19.
//

import Foundation
import UIKit

class ThirdViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewBackGroundColor(.white_bg)
        setTitleColor(.black_mainFont)
        
        for _ in 0...20000 {
            let tempView = BaseView(frame: CGRect(x: 50, y: 100, width: 250, height: 600))
            tempView.setBackGroundColor(.black_mainFont)
            view.addSubview(tempView)
        }
    }
}
