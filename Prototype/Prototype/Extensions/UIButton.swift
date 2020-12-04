//
//  UIButton.swift
//  Prototype
//
//  Created by Mateus Augusto M Ferreira on 29/11/20.
//

import Foundation
import UIKit

extension UIButton {
    
    func centerLabelVerticallyWithPadding(spacing:CGFloat, alingment: CGFloat) {
        // update positioning of image and title
        let imageSize = self.imageView!.frame.size
        self.titleEdgeInsets = UIEdgeInsets(top:0, left:(-imageSize.width) + alingment, bottom:-(imageSize.height + spacing), right:0)
        let titleSize = self.titleLabel!.frame.size
        self.imageEdgeInsets = UIEdgeInsets(top:-(titleSize.height + spacing),
                                            left:0,
                                            bottom: 0,
                                            right:-titleSize.width)
        
        // reset contentInset, so intrinsicContentSize() is still accurate
        let trueContentSize = self.titleLabel!.frame.union(self.imageView!.frame).size
        let oldContentSize = self.intrinsicContentSize
        let heightDelta = trueContentSize.height - oldContentSize.height
        let widthDelta = trueContentSize.width - oldContentSize.width
        self.contentEdgeInsets = UIEdgeInsets(top:heightDelta/2.0,
                                              left:widthDelta/2.0,
                                              bottom:heightDelta/2.0,
                                              right:widthDelta/2.0)
    }
}
