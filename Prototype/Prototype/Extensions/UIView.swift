//
//  UIView.swift
//  Smiler
//
//  Created by Mateus Augusto Moraes Ferreira on 28/05/21.
//

import Foundation
import UIKit

extension UIView {
    public func core_rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi/2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = 0
        self.layer.add(rotation, forKey: "rotationanimationkey")
    }
    
    public func roundCorners(corners: UIRectCorner, radius: CGFloat, color: UIColor) {
        self.contentScaleFactor = UIScreen.main.scale
        self.layer.rasterizationScale = UIScreen.main.scale
        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    public func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        self.contentScaleFactor = UIScreen.main.scale
        self.layer.rasterizationScale = UIScreen.main.scale
        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

    @IBInspectable
    public var borderWidth: CGFloat {
        set(value) {
            layer.borderWidth = value
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor? {
        set(value) {
            layer.borderColor = value?.cgColor
        }
        get {
            return UIColor(cgColor: self.layer.borderColor ?? UIColor.clear.cgColor)
        }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat {
        set(value) {
            layer.cornerRadius = value
            layer.masksToBounds = value > 0
        }
        get {
            return self.layer.cornerRadius
        }
    }

    @IBInspectable
    public var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.masksToBounds = false
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    public var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.masksToBounds = false
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    public var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.masksToBounds = false
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    public var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
}

extension UIView {
    public func removeAllSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
}
