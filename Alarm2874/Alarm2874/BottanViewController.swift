//
//  BottanViewController.swift
//  Alarm2874
//
//  Created by Student on 2024/06/18.
//



import UIKit

class SleepingViewController: UIViewController {
    let dynamicButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        dynamicButton.frame = CGRect(x: 0, y: 0, width: 220, height: 70)
        dynamicButton.center = view.center
        dynamicButton.setTitle("動的配置ボタン", for: .normal)
        dynamicButton.addTarget(self, action: #selector(moveButton), for: .touchUpInside)

        view.addSubview(dynamicButton)
    }

    @objc func moveButton() {
        UIView.animate(withDuration: 0.5) {
            self.dynamicButton.frame.origin = CGPoint(x: self.view.bounds.maxX - 230, y: self.view.bounds.maxY - 80)
        }
    }
}
