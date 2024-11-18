//
//  FirstViewController.swift
//  DarkModeDemo
//
//  Created by 李雨泽 on 2024/11/13.
//

import Foundation
import UIKit

class FirstViewController: BaseViewController {
    var label = BaseUILabel(frame: CGRect(x: 50, y: 120, width: 200, height: 30))
    var button = BaseUIButton(frame: CGRect(x: 50, y: 180, width: 200, height: 40))
    var mySwitch = UISwitch(frame: CGRect(x: 260, y: 120, width: 60, height: 30))
    var testView = UIView(frame: CGRect(x: 50, y: 240, width: UIScreen.main.bounds.width - 100, height: 120))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setViewBackGroundColor(.white_bg)
        
        label.text = "切换深色模式开关"
        label.setTextColor(.black_mainFont)
        view.addSubview(label)
        
        button.setTitle("这是一个button", for: .normal)
        button.setTitleColor(.black_mainFont, .normal)
        view.addSubview(button)

        mySwitch.isOn = true
        mySwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        view.addSubview(mySwitch)
        
        let label = UILabel()
        label.textColor = .black_mainFont
        label.text = "这是一个UIView"
        addSubview(label)
        testView.backgroundColor = .black_mainFont
        view.addSubview(testView)
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            ThemeManager.shared.applyTheme(.dark)
            view.layoutIfNeeded()
        } else {
            ThemeManager.shared.applyTheme(.light)
        }
    }
}
