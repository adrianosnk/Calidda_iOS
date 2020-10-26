//
//  UIView.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

extension UIView {
    func addSubViewWithLayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        self.addSubview(view)
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func loadNib() -> UIView { let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func dropShadow(color: UIColor = .black, opacity: Float = 0.25, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    
    func dropShadowNewest(scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.25
      layer.shadowOffset = CGSize(width: -1, height: -1)
      layer.shadowRadius = 1

      layer.shadowPath = UIBezierPath(rect: bounds).cgPath
      layer.shouldRasterize = true
      //layer.rasterizationScale = scale ? UIScreen.main.scale : 1
      layer.rasterizationScale = 1
    }
    
    
}

// MARK: Constraints

extension UIView {
    
    func addShadowViewCustom(cornerRadius: CGFloat, opacity: Float = 0.2, radius: CGFloat = 5) {
        
        self.layer.cornerRadius = cornerRadius//viewCustom.bounds.height / 2
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.masksToBounds = false
    }

    func leadingConstraintEqualTo(item: UIView? = nil , attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func leadingConstraintLessOrEqualTo(item: UIView? = nil , attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .lessThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func leadingConstraintGreaterOrEqualTo(item: UIView? = nil , attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    //------------------------------------------------------------------------------------------------------
    
    func trailingConstraintEqualTo(item: UIView? = nil , attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func trailingConstraintLessOrEqualTo(item: UIView? = nil , attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func trailingConstraintGreaterOrEqualTo(item: UIView? = nil , attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .greaterThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    //------------------------------------------------------------------------------------------------------
    
    func topConstraintEqualTo(item: UIView? = nil , attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func topConstraintLessOrTo(item: UIView? = nil , attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .top, relatedBy: .lessThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func topConstraintGreaterOrEqualTo(item: UIView? = nil , attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .top, relatedBy: .greaterThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    //------------------------------------------------------------------------------------------------------
    
    func bottomConstraintEqualTo(item: UIView? = nil , attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func bottomConstraintLessOrEqualTo(item: UIView? = nil , attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .lessThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func bottomConstraintGreaterOrEqualTo(item: UIView? = nil , attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    //------------------------------------------------------------------------------------------------------
    
    func heightConstraintEqualTo(item: UIView? = nil , attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func heightConstraintLessOrEqualTo(item: UIView? = nil , attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .height, relatedBy: .lessThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func heightConstraintGreaterOrEqualTo(item: UIView? = nil , attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .height, relatedBy: .greaterThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    //------------------------------------------------------------------------------------------------------
    
    func widthConstraintEqualTo(item: UIView? = nil, attribute: NSLayoutConstraint.Attribute  = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func widthConstraintLessOrEqualTo(item: UIView? = nil, attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .width, relatedBy: .lessThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func widthConstraintGreaterOrEqualTo(item: UIView? = nil, attribute: NSLayoutConstraint.Attribute = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .width, relatedBy: .greaterThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    //------------------------------------------------------------------------------------------------------
    
    func centerXContraintEqualTo(item: UIView? = nil, attribute: NSLayoutConstraint.Attribute  = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func centerXContraintLessOrEqualTo(item: UIView? = nil, attribute: NSLayoutConstraint.Attribute  = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .lessThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func centerXContraintGreaterOrEqualTo(item: UIView? = nil, attribute: NSLayoutConstraint.Attribute  = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .greaterThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    //------------------------------------------------------------------------------------------------------
    
    func centerYContraintEqualTo(item: UIView? = nil, attribute: NSLayoutConstraint.Attribute  = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func centerYContraintLessOrEqualTo(item: UIView? = nil, attribute: NSLayoutConstraint.Attribute  = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .lessThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    func centerYContraintGreaterOrEqualTo(item: UIView? = nil, attribute: NSLayoutConstraint.Attribute  = .notAnAttribute, constant: CGFloat = 0) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .greaterThanOrEqual, toItem: item, attribute: attribute, multiplier: 1, constant: constant)
    }
    
    
    func addDashedBorder() {
        
        /*
        let color = UIColor.black
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath
        
        self.layer.addSublayer(shapeLayer) */
        
        let color = UIColor.black.cgColor
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = (self.frame.size)
        let shapeRect = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 1
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [2,2]
        shapeLayer.path = UIBezierPath(rect: shapeRect).cgPath
        
        self.layer.addSublayer(shapeLayer)
        
    }
    
    
}
