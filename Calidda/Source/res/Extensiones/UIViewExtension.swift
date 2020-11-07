//
//  UIViewExtension.swift
//  Claro Hogar
//
//  Created by Daniel Aragon Ore on 12/28/18.
//  Copyright © 2018 Claro. All rights reserved.
//
 
import Foundation
import UIKit
extension UIView {
    func addDiamondMask(cornerRadius: CGFloat = 0) {
        let path = UIBezierPath()
        let points = [
            CGPoint(x: bounds.midX, y: bounds.minY),
            CGPoint(x: bounds.maxX, y: bounds.midY),
            CGPoint(x: bounds.midX, y: bounds.maxY),
            CGPoint(x: bounds.minX, y: bounds.midY)
        ]
        path.move(to: point(from: points[0], to: points[1], distance: cornerRadius, fromStart: true))
        for i in 0 ..< 4 {
            path.addLine(to: point(from: points[i], to: points[(i + 1) % 4], distance: cornerRadius, fromStart: false))
            path.addQuadCurve(to: point(from: points[(i + 1) % 4], to: points[(i + 2) % 4], distance: cornerRadius, fromStart: true), controlPoint: points[(i + 1) % 4])
        }
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.clear.cgColor
        layer.mask = shapeLayer
    }
    private func point(from point1: CGPoint, to point2: CGPoint, distance: CGFloat, fromStart: Bool) -> CGPoint {
        let start: CGPoint
        let end: CGPoint
        
        if fromStart {
            start = point1
            end = point2
        } else {
            start = point2
            end = point1
        }
        let angle = atan2(end.y - start.y, end.x - start.x)
        return CGPoint(x: start.x + distance * cos(angle), y: start.y + distance * sin(angle))
    }
    
    func addFullScreenConstraints() {
        guard let superview = self.superview else {
            return
        }
        
        self.translatesAutoresizingMaskIntoConstraints = true
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[subview]-0-|",
                                                                options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
        superview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[subview]-0-|",
                                                                options: .directionLeadingToTrailing, metrics: nil, views: ["subview": self]))
    }
    
    static func createInstance<T: UIView>(ofType type: T.Type) -> T {
        let className = NSStringFromClass(type).components(separatedBy: ".").last
        return Bundle.main.loadNibNamed(className!, owner: self, options: nil)![0] as! T
    }
    
    func removeAllSubViews(){
        self.subviews.forEach { $0.removeFromSuperview() }
    }
}


extension UILabel{
    func setFocused(){
        self.font = UIFont(name: "HelveticaNeue-Bold", size: 14)
        self.textColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        
    }
    func setNormal(){
        self.font = UIFont(name: "HelveticaNeue", size: 14)
        self.textColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        
    }
}


extension UIView {
    
    var shakeKey: String { return "ShakeAnimation" }
    
    func shake() {
        layer.removeAnimation(forKey: shakeKey)
        let vals: [Double] = [-2, 2, -2, 2, 0]
        
        let translation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        translation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        translation.values = vals
        
        let rotation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotation.values = vals.map { (degrees: Double) in
            let radians: Double = (Double.pi * degrees) / 180.0
            return radians
        }
        
        let shakeGroup: CAAnimationGroup = CAAnimationGroup()
        shakeGroup.animations = [translation, rotation]
        shakeGroup.duration = 0.3
        self.layer.add(shakeGroup, forKey: shakeKey)
    }
    
}
