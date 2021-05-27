//
//  SpinnerViewControlle.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 24/05/21.
//

import UIKit

class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)

    let mensage:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Localizando suas coordenadas"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func loadView() {
        view = UIView()
        view.layer.zPosition = 3
        
        let viewSpinner = UIView(frame: CGRect.zero)
        viewSpinner.backgroundColor = .clear
        viewSpinner.layer.cornerRadius = 10
        viewSpinner.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(viewSpinner)

        viewSpinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        viewSpinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewSpinner.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        viewSpinner.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.18).isActive = true
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = viewSpinner.bounds
        blurEffectView.layer.cornerRadius = 20
        blurEffectView.clipsToBounds = true
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewSpinner.addSubview(blurEffectView)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        viewSpinner.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: viewSpinner.centerXAnchor).isActive = true
        spinner.topAnchor.constraint(equalTo: viewSpinner.topAnchor, constant: 45).isActive = true
        
        viewSpinner.addSubview(mensage)
        
        mensage.bottomAnchor.constraint(equalTo: viewSpinner.bottomAnchor,constant: -20).isActive = true
        mensage.centerXAnchor.constraint(equalTo: viewSpinner.centerXAnchor).isActive = true
        mensage.widthAnchor.constraint(equalTo: viewSpinner.widthAnchor).isActive = true
    }

}
