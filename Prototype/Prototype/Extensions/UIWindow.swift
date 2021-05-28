//
//  UIWindow.swift
//  Smiler
//
//  Created by Mateus Augusto Moraes Ferreira on 28/05/21.
//

import Foundation
import UIKit

extension UIWindow {
    public static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
