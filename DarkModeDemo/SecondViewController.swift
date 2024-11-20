//
//  SecondViewController.swift
//  DarkModeDemo
//
//  Created by 李雨泽 on 2024/11/13.
//

import UIKit
import Foundation

class SecondViewController: BaseViewController {
    var createViewButton = BaseUIButton(frame: CGRect(x: 50, y: 120, width: 100, height: 30))
    var createNewVCButton = BaseUIButton(frame: CGRect(x: 170, y: 120, width: 100, height: 30))
    
    var currentY = 150
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewBackGroundColor(.white_bg)
        setTitleColor(.black_mainFont)
        
        createViewButton.setTitleColor(.black_mainFont, .normal)
        createViewButton.setTitle("创建view", for: .normal)
        createViewButton.addTarget(self, action: #selector(createViewButtonClicked), for: .touchUpInside)
        view.addSubview(createViewButton)
        
        createNewVCButton.setTitleColor(.black_mainFont, .normal)
        createNewVCButton.setTitle("创建VC", for: .normal)
        createNewVCButton.addTarget(self, action: #selector(createNewVCButtonClicked), for: .touchUpInside)
        view.addSubview(createNewVCButton)
    }
    
    @objc func createViewButtonClicked() {
        let tempView = BaseView(frame: CGRect(x: 50, y: currentY, width: 250, height: 30))
        tempView.setBackGroundColor(.black_mainFont)
        view.addSubview(tempView)
        
        currentY += 40
    }
    
    @objc func createNewVCButtonClicked() {
        let vc = SecondViewController()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
