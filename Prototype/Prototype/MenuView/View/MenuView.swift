//
//  MenuView.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 31/03/21.
//

import UIKit

class MenuView:UIView {
    
    let deviceImage:UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .white
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Rectangle 26")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let alertHourView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let setUpsView:UIStackView = {
        let view = UIStackView(frame: .zero)
        view.backgroundColor = .white
        view.alignment = .top
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let shareLocationView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let modesView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //Suplementary Views
    
    let stackAlertHourView:UIStackView = {
        let view = UIStackView(frame: .zero)
        view.backgroundColor = .white
        view.alignment = .top
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 0
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleAlertHourView:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Horário de Alerta"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hourOfAlertHourView:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "18:00Hrs Às 23:00Hrs"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonAlertHourView:UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Editar", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let setUpsViewLabel1:UILabel = {
        let colorBack = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        let label = UILabel(frame: .zero)
        label.text = "Gerenciador de Acessos"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.textColor = .black
        label.backgroundColor = colorBack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let setUpsViewLabel2:UILabel = {
        let colorBack = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        let label = UILabel(frame: .zero)
        label.text = "Gerenciador de contatos"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.backgroundColor = colorBack
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let setUpsViewButton1:UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Editar Acessos", for: .normal)
        button.tintColor = .black
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let setUpsViewButton2:UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Gatilhos de emergência", for: .normal)
        button.tintColor = .black
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let textShareLocationView:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Compartilhar Localização em tempo real"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let switchShareLocationView:UISwitch = {
        let switch_ = UISwitch(frame: .zero)
        switch_.isOn = true
        switch_.translatesAutoresizingMaskIntoConstraints = false
        return switch_
    }()
    
    let textModesView:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Modos Smiler"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var pickerModesView:UIPickerView = {
        let picker = UIPickerView(frame: .zero)
        let colorBack = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1.0)
        picker.backgroundColor = colorBack
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        let colorBack = UIColor(red: 213/255.0, green: 212/255.0, blue: 220/255.0, alpha: 1.0)
        backgroundColor = colorBack
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuView:ViewCodable {
    func setupViewHierarchy() {
        //self.addSubview(deviceImage)
        self.addSubview(alertHourView)
        self.addSubview(setUpsView)
        self.addSubview(shareLocationView)
        self.addSubview(modesView)
        
        //Suplementary SubView
        alertHourView.addSubview(stackAlertHourView)
        stackAlertHourView.addArrangedSubview(titleAlertHourView)
        stackAlertHourView.addArrangedSubview(hourOfAlertHourView)
        stackAlertHourView.addArrangedSubview(buttonAlertHourView)
        
        setUpsView.addArrangedSubview(setUpsViewLabel1)
        setUpsView.addArrangedSubview(setUpsViewButton1)
        setUpsView.addArrangedSubview(setUpsViewLabel2)
        setUpsView.addArrangedSubview(setUpsViewButton2)
        
        shareLocationView.addSubview(textShareLocationView)
        shareLocationView.addSubview(switchShareLocationView)
        
        modesView.addSubview(textModesView)
        modesView.addSubview(pickerModesView)
    }
    
    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            deviceImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.23),
//            deviceImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2),
//            deviceImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
//            deviceImage.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor,constant: 5),
//        ])
//
        NSLayoutConstraint.activate([
            alertHourView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.5),
            alertHourView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2),
            alertHourView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            alertHourView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor,constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            setUpsView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2),
            setUpsView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            setUpsView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            setUpsView.topAnchor.constraint(equalTo: self.alertHourView.bottomAnchor,constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            shareLocationView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.07),
            shareLocationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            shareLocationView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            shareLocationView.topAnchor.constraint(equalTo: self.setUpsView.bottomAnchor,constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            modesView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2),
            modesView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            modesView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            modesView.topAnchor.constraint(equalTo: self.shareLocationView.bottomAnchor,constant: 20),
        ])
        
        //Suplementary Subviews
        
        NSLayoutConstraint.activate([
            stackAlertHourView.topAnchor.constraint(equalTo: alertHourView.topAnchor),
            stackAlertHourView.leadingAnchor.constraint(equalTo: alertHourView.leadingAnchor),
            stackAlertHourView.trailingAnchor.constraint(equalTo: alertHourView.trailingAnchor),
            stackAlertHourView.bottomAnchor.constraint(equalTo: alertHourView.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            titleAlertHourView.widthAnchor.constraint(equalTo: alertHourView.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            hourOfAlertHourView.widthAnchor.constraint(equalTo: alertHourView.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            buttonAlertHourView.widthAnchor.constraint(equalTo: alertHourView.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            setUpsViewLabel1.leadingAnchor.constraint(equalTo: setUpsView.leadingAnchor, constant: 5),
            setUpsViewLabel1.widthAnchor.constraint(equalTo: setUpsView.widthAnchor),
            setUpsViewLabel1.heightAnchor.constraint(equalTo: setUpsView.heightAnchor, multiplier: 0.25),
        ])
        
        NSLayoutConstraint.activate([
            setUpsViewLabel2.widthAnchor.constraint(equalTo: setUpsView.widthAnchor),
            setUpsViewLabel2.heightAnchor.constraint(equalTo: setUpsView.heightAnchor, multiplier: 0.25),
        ])
        
        NSLayoutConstraint.activate([
            setUpsViewButton1.heightAnchor.constraint(equalTo: setUpsView.heightAnchor, multiplier: 0.25),
        ])
        
        NSLayoutConstraint.activate([
            setUpsViewButton2.heightAnchor.constraint(equalTo: setUpsView.heightAnchor, multiplier: 0.25),
        ])
        
        NSLayoutConstraint.activate([
            textShareLocationView.widthAnchor.constraint(equalTo: shareLocationView.widthAnchor, multiplier: 0.5),
            textShareLocationView.leadingAnchor.constraint(equalTo: shareLocationView.leadingAnchor,constant: 5),
            textShareLocationView.centerYAnchor.constraint(equalTo: shareLocationView.centerYAnchor),
        
        ])
        
        NSLayoutConstraint.activate([
            switchShareLocationView.trailingAnchor.constraint(equalTo: shareLocationView.trailingAnchor, constant: -20),
            switchShareLocationView.centerYAnchor.constraint(equalTo: shareLocationView.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            textModesView.widthAnchor.constraint(equalTo: modesView.widthAnchor, multiplier: 0.5),
            textModesView.heightAnchor.constraint(equalTo: modesView.heightAnchor, multiplier: 0.1),
            textModesView.leadingAnchor.constraint(equalTo: modesView.leadingAnchor,constant: 5),
            textModesView.topAnchor.constraint(equalTo: modesView.topAnchor,constant: 5),
        ])
        
        NSLayoutConstraint.activate([
            pickerModesView.heightAnchor.constraint(equalTo: modesView.heightAnchor, multiplier: 0.7),
            pickerModesView.trailingAnchor.constraint(equalTo: modesView.trailingAnchor),
            pickerModesView.leadingAnchor.constraint(equalTo: modesView.leadingAnchor),
            pickerModesView.topAnchor.constraint(equalTo: textModesView.bottomAnchor,constant: 20),
        ])
        
    }
}
