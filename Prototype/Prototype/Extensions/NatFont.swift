//
//  NatFont.swift
//  Smiler
//
//  Created by Mateus Augusto Moraes Ferreira on 28/05/21.
//

import UIKit
import NatDS

extension UIFont {
    public static func robotoRegular(size: CGFloat, italic: Bool = false) -> UIFont {
        return UIFont(name: italic ? "Roboto-Italic" : "Roboto-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public static func robotoThin(size: CGFloat, italic: Bool = false) -> UIFont {
        return UIFont(name: italic ? "Roboto-Thin" : "Roboto-Thin", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public static func robotoLight(size: CGFloat, italic: Bool = false) -> UIFont {
        return UIFont(name: italic ? "Roboto-LightItalic" : "Roboto-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public static func robotoMedium(size: CGFloat, italic: Bool = false) -> UIFont {
        return UIFont(name: italic ? "Roboto-MediumItalic" : "Roboto-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public static func robotoBold(size: CGFloat, italic: Bool = false) -> UIFont {
        return UIFont(name: italic ? "Roboto-BoldItalic" : "Roboto-Bold", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public static func robotoBlack(size: CGFloat, italic: Bool = false) -> UIFont {
        return UIFont(name: italic ? "Roboto-BlackItalic" : "Roboto-Black", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public func applyTraitsTo(font: UIFont) -> UIFont? {
        let traits = self.fontDescriptor.symbolicTraits
        if let newFont = font.fontDescriptor.withSymbolicTraits(traits) {
            return UIFont.init(descriptor: newFont, size: 0)
        }
        return nil
    }
}

extension NatFonts {
    public static func fontRoboto(ofSize size: Size, withWeight weight: Weight) -> UIFont {
        let font = self.font(ofSize: size, withWeight: weight)
        
        switch weight {
        case .regular:
            return .robotoRegular(size: font.pointSize)
        case .medium:
            return .robotoMedium(size: font.pointSize)
        case .bold:
            return .robotoBold(size: font.pointSize)
        }
    }
}
