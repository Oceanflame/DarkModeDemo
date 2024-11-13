//
//  FirstViewController.swift
//  DarkModeDemo
//
//  Created by 李雨泽 on 2024/11/13.
//

import Foundation
import UIKit

class FirstViewController: BaseViewController {
    var label = UILabel(frame: CGRect(x: 50, y: 100, width: 200, height: 30))
    var button = UIButton(frame: CGRect(x: 50, y: 160, width: 200, height: 40))
    var mySwitch = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white_bg
        
        label.text = "这是一个label"
        label.textColor = .black_mainFont
        view.addSubview(label)
        
        button.setTitle("这是一个button", for: .normal)
        button.setTitleColor(.black_mainFont, for: .normal)
        view.addSubview(button)
        

        mySwitch.center = view.center
        mySwitch.isOn = true
        mySwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        view.addSubview(mySwitch)
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
