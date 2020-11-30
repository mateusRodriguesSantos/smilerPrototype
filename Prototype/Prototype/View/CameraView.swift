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
    
    let faceView:FaceView = {
        let view = FaceView(frame: .zero)
        view.backgroundColor = .clear
        view.layer.zPosition = 0
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        self.isUserInteractionEnabled = true
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CameraView:ViewCodable{
    func setupViewHierarchy() {
        self.addSubview(faceView)
        self.layer.addSublayer(faceView.layer)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            faceView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            faceView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            faceView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            faceView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}
