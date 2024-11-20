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
    var testView = BaseView(frame: CGRect(x: 50, y: 280, width: UIScreen.main.bounds.width - 100, height: 120))
    var imageView = BaseImageView(imageName: "太阳")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setViewBackGroundColor(.white_bg)
        setTitleColor(.black_mainFont)
        
        label.text = "切换深色模式开关"
        label.setTextColor(.black_mainFont)
        view.addSubview(label)
        
        button.setTitle("这是一个button", for: .normal)
        button.setTitleColor(.black_mainFont, .normal)
        view.addSubview(button)

        mySwitch.isOn = false
        mySwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        view.addSubview(mySwitch)
        
        let label = BaseUILabel(frame: CGRect(x: 50, y: 240, width: 200, height: 20))
        label.setTextColor(.black_mainFont)
        label.text = "这是一个UIView"
        view.addSubview(label)
        testView.setBackGroundColor(.black_mainFont)
        view.addSubview(testView)
        
        let imageViewLabel = BaseUILabel(frame: CGRect(x: 50, y:420, width: 200, height: 20))
        imageViewLabel.setTextColor(.black_mainFont)
        imageViewLabel.text = "这是一个UIImageView"
        view.addSubview(imageViewLabel)
        
        imageView.frame = CGRect(x: 50, y: 460, width: 150, height: 140)
        view.addSubview(imageView)
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
