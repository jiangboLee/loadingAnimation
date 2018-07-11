//
//  ViewController.swift
//  loadingAnimation
//
//  Created by 李江波 on 2018/7/11.
//  Copyright © 2018年 lijiangbo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var holderView = HolderView(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addHolderView()
        holderView.addOval()
        
        addAgainButton()
    }
    
    func addHolderView() {
        let boxSize: CGFloat = 100.0
        holderView.frame = CGRect(x: view.bounds.width / 2 - boxSize / 2, y: view.bounds.height / 2 - boxSize / 2 , width: boxSize, height: boxSize)
        holderView.parentFrame = view.frame
        holderView.delegate = self
        view.addSubview(holderView)
    }
    func addAgainButton() {
        let button = UIButton(type: .custom)
        button.setTitle("again", for: .normal)
        button.setTitleColor(Colors.blue, for: .normal)
        button.frame = CGRect(x: 200, y: 100, width: 100, height: 80)
        button.addTarget(self, action: #selector(clickAction), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc func clickAction() {
        view.backgroundColor = Colors.white
        _ = view.subviews.map({$0.removeFromSuperview()})
        holderView = HolderView(frame: CGRect.zero)
        viewDidAppear(true)
    }
}

extension ViewController: HolderViewDelegate {
    func animateLable() {
        
        holderView.removeFromSuperview()
        view.backgroundColor = Colors.blue
        
        let lable = UILabel(frame: view.frame)
        lable.textColor = Colors.white
        lable.font = UIFont.systemFont(ofSize: 120)
        lable.textAlignment = .center
        lable.text = "LEE"
        lable.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        view.addSubview(lable)
        UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseInOut, animations: {
            lable.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }) { (finished) in
            UIView.animate(withDuration: 0.4, delay: 0.0, options: .curveEaseInOut, animations: {
                lable.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }) { (finished) in
                
            }
        }
    }
}






















