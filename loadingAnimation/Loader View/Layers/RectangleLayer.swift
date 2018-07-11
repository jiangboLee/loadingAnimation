//
//  RectangleLayer.swift
//  loadingAnimation
//
//  Created by 李江波 on 2018/7/11.
//  Copyright © 2018年 lijiangbo. All rights reserved.
//

import UIKit

class RectangleLayer: CAShapeLayer {
    
    override init() {
        super.init()
        fillColor = Colors.clear.cgColor
        lineWidth = 5.0
        path = rectanglePathFull.cgPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var rectanglePathFull: UIBezierPath {
        let rectranglePath = UIBezierPath()
        rectranglePath.move(to: CGPoint(x: 0.0, y: 100.0))
        rectranglePath.addLine(to: CGPoint(x: 0.0, y: -lineWidth))
        rectranglePath.addLine(to: CGPoint(x: 100.0, y: -lineWidth))
        rectranglePath.addLine(to: CGPoint(x: 100.0, y: 100.0))
        rectranglePath.addLine(to: CGPoint(x: -lineWidth / 2, y: 100.0))
        rectranglePath.close()
        return rectranglePath
    }
    
    func animateStrokeWithColor(color: UIColor) {
        strokeColor = color.cgColor
        let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.fromValue = 0.0
        strokeAnimation.toValue = 1.0
        strokeAnimation.duration = 0.4
        add(strokeAnimation, forKey: nil)
    }
}
