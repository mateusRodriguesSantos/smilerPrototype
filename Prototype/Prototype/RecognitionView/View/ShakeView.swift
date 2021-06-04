//
//  CameraView.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 24/11/20.
//

import UIKit

class ShakeView:UIView{
    
    //Variables
    
    //UI components
    
    let labelShake: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.text = "Faça um Shake!!!\nCaso esteja em situação de perigo"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: Fonts.RobotoBold, size: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageShake: UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.image = UIImage(named: "shake")
        imageView.isHidden = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.zPosition = 3
        return imageView
    }()
    
    let menuButton:UIButton = {
        let button = UIButton(frame: .zero)
        button.setBackgroundImage(UIImage(named: "SettingsIconsettings"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    init() {
        super.init(frame: .zero)
        let colorBack = UIColor(red: 213/255.0, green: 212/255.0, blue: 220/255.0, alpha: 1.0)
        backgroundColor = colorBack
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShakeView:ViewCodable{
    func setupViewHierarchy() {
        self.addSubview(imageShake)
        self.addSubview(labelShake)
        self.addSubview(menuButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageShake.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 0.8),
            imageShake.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.48),
            imageShake.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageShake.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            labelShake.topAnchor.constraint(equalTo: imageShake.bottomAnchor),
            labelShake.widthAnchor.constraint(equalTo: self.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            menuButton.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            menuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
        ])
    }
}
