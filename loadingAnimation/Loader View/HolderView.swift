//
//  HolderView.swift
//  loadingAnimation
//
//  Created by 李江波 on 2018/7/11.
//  Copyright © 2018年 lijiangbo. All rights reserved.
//

import UIKit

protocol HolderViewDelegate: class {
    func animateLable()
}
class HolderView: UIView {

    var parentFrame = CGRect.zero
    weak var delegate: HolderViewDelegate?
    let ovalLayer = OvalLayer()
    let triangleLayer = TriangleLayer()
    let redRectangleLayer = RectangleLayer()
    let blueRectangleLayer = RectangleLayer()
    let arcLayer = ArcLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addOval() {
        layer.addSublayer(ovalLayer)
        ovalLayer.expand()
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(wobbleOval), userInfo: nil, repeats: false)
    }
    @objc func wobbleOval() {
        layer.addSublayer(triangleLayer)
        ovalLayer.wobble()
        Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(drawAnimatedTriangle), userInfo: nil, repeats: false)
    }
    @objc func drawAnimatedTriangle() {
        triangleLayer.animate()
        Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(spinAndTransform), userInfo: nil, repeats: false)
    }
    @objc func spinAndTransform() {
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.6)
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = CGFloat(Double.pi * 2)
        rotationAnimation.duration = 0.45
        rotationAnimation.isRemovedOnCompletion = true
        layer.add(rotationAnimation, forKey: nil)
        ovalLayer.contract()
        
        Timer.scheduledTimer(timeInterval: 0.45, target: self, selector: #selector(drawRedAnimationRectangle), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 0.65, target: self, selector: #selector(drawBlueAnimationRectangle), userInfo: nil, repeats: false)
    }
    
    @objc func drawRedAnimationRectangle() {
        layer.addSublayer(redRectangleLayer)
        redRectangleLayer.animateStrokeWithColor(color: Colors.red)
    }
    @objc func drawBlueAnimationRectangle() {
        layer.addSublayer(blueRectangleLayer)
        blueRectangleLayer.animateStrokeWithColor(color: Colors.blue)
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(drawArc), userInfo: nil, repeats: false)
    }
    @objc func drawArc() {
        layer.addSublayer(arcLayer)
        arcLayer.animate()
        Timer.scheduledTimer(timeInterval: 0.90, target: self, selector: #selector(expandView), userInfo: nil, repeats: false)
    }
    @objc func expandView() {
        backgroundColor = Colors.blue
        frame = CGRect(x: frame.origin.x - blueRectangleLayer.lineWidth, y: frame.origin.y - blueRectangleLayer.lineWidth, width: frame.size.width + blueRectangleLayer.lineWidth * 2, height: frame.size.height + blueRectangleLayer.lineWidth * 2)
        layer.sublayers = nil
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.frame = self.parentFrame
        }) { (finished) in
            self.addLable()
        }
        
    }
    
    func addLable() {
        delegate?.animateLable()
    }
}










