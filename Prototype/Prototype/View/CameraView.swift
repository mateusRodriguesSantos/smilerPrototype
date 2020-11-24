//
//  CameraView.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 24/11/20.
//

import UIKit

class CameraView:UIView{
    
    //Variables
    
    //UI components
    
    init() {
        super.init(frame: CGRect.zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CameraView:ViewCodable{
    func setupViewHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
}
