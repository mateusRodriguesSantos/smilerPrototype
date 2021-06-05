//
//  FeedbackButton.swift
//  Smiler
//
//  Created by Mateus Augusto Moraes Ferreira on 28/05/21.
//

import Foundation
import UIKit
import ABBadgeButton

class FeedbackButton: ABBadgeButton {
    private let transformScale: CGFloat = 0.98
    
    @IBInspectable var hapticFeedback: Bool = false
    @IBInspectable var visualFeedback: Bool = false
    
    private func startHapticFeedback() {
        
    }
    
    override var isHighlighted: Bool {
        get {
            return super.isHighlighted
        }
        set {
            if newValue {
                if hapticFeedback {
                    startHapticFeedback()
                }
                
                if visualFeedback {
                    UIView.animate(withDuration: 0.1, delay: 0.0, options: [.curveEaseOut], animations: {
                        self.transform = CGAffineTransform(scaleX: self.transformScale, y: self.transformScale)
                    }, completion: nil)
                }
            } else if newValue == false {
                if visualFeedback {
                    UIView.animate(withDuration: 0.1, delay: 0.0, options: [.curveEaseOut], animations: {
                        self.transform = .identity
                    }, completion: nil)
                }
            }
        }
    }
    
    public func setBadgeNumber(_ number: Int) {
        self.badgeOriginOffset = CGPoint(x: -18, y: 22)
        self.badgeBackgroundColor = UIColor(red: 255/255, green: 107/255, blue: 11/255, alpha: 1.0)
        self.badgeValue = number == 0 ? "" : "\(number)"
    }
  
    public func setBadgeCounter(_ number: Int) {
        self.badgeOriginOffset = CGPoint(x: -10, y: 30)
        self.badgeBackgroundColor = UIColor(red: 255/255, green: 107/255, blue: 11/255, alpha: 1.0)
        self.badgeValue = number == 0 ? "" : "\(number)"
    }
}
