//
//  AlertsView.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit

class AlertsView:UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        let colorBack = UIColor(red: 213/255.0, green: 212/255.0, blue: 220/255.0, alpha: 1.0)
        backgroundColor = colorBack
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlertsView:ViewCodable {
    func setupViewHierarchy() {
       
    }
    
    func setupConstraints() {

    }
}
