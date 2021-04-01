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
    
    let tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let shareLocationView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let modesView:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        self.addSubview(deviceImage)
        self.addSubview(alertHourView)
        self.addSubview(tableView)
        self.addSubview(shareLocationView)
        self.addSubview(modesView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            deviceImage.widthAnchor.constraint(equalToConstant: 70),
            deviceImage.heightAnchor.constraint(equalToConstant: 100),
            deviceImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            deviceImage.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor,constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            alertHourView.widthAnchor.constraint(equalToConstant: 150),
            alertHourView.heightAnchor.constraint(equalToConstant: 100),
            alertHourView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            alertHourView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor,constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(equalToConstant: 180),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.alertHourView.bottomAnchor,constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            shareLocationView.heightAnchor.constraint(equalToConstant: 50),
            shareLocationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            shareLocationView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            shareLocationView.topAnchor.constraint(equalTo: self.tableView.bottomAnchor,constant: 20),
        ])
        
        NSLayoutConstraint.activate([
            modesView.heightAnchor.constraint(equalToConstant: 80),
            modesView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            modesView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            modesView.topAnchor.constraint(equalTo: self.shareLocationView.bottomAnchor,constant: 20),
        ])
    }
}
