//
//  ExpressionView.swift
//  Prototype
//
//  Created by Mateus Augusto M Ferreira on 30/11/20.
//

import Foundation
import UIKit

class ExpressionView: UIView{
    
    //Variables
    //UI components
    
    let backgroundSettings: UIImageView = {
        let background = UIImageView(image: UIImage(named: "background"))
        background.contentMode = .scaleAspectFill
        background.translatesAutoresizingMaskIntoConstraints = false
        return background
    }()
    
    
    init() {
        super.init(frame: CGRect.zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExpressionView:ViewCodable{
    func setupViewHierarchy() {
        self.setupBackground()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            //Bacground Settings Constraints
            backgroundSettings.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            backgroundSettings.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            backgroundSettings.widthAnchor.constraint(equalTo: self.widthAnchor),
            backgroundSettings.heightAnchor.constraint(equalTo: self.heightAnchor),
            
        ])
    }
    
    func setupBackground(){
        self.addSubview(backgroundSettings)
    }
}

