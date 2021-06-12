//
//  AlertsView.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit

class AlertsView:UIView {

    let title:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Horários de alerta"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitle:UILabel = {
        let colorBack = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        let label = UILabel(frame: .zero)
        label.text = "Adicionar"
        label.numberOfLines = 0
        label.textColor = .white
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var addAlarmView:UIStackView = {
        let view = UIStackView(frame: .zero)
        view.backgroundColor = .white
        view.alignment = .center
        view.axis = .horizontal
        view.distribution = .fill
        let border = CALayer()
        border.frame = CGRect(x:0, y: view.layer.frame.height - 0.28, width: view.layer.frame.width, height:0.28)
        view.layer.insertSublayer(border, at: 0)
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let addHourAlert:UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("+", for: .normal)
        button.tintColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textColor = .systemBlue
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.font = UIFont(name: Fonts.RobotoRegular, size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let backAddHourAlert:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 6
        view.alpha = 0.2
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleAlarmView:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Hora"
        label.numberOfLines = 0
        label.font = UIFont(name: Fonts.RobotoRegular, size: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var pickerAlarmView:UIDatePicker = {
        let picker = UIDatePicker()
        picker.locale = Locale(identifier: "en_BR")
        picker.preferredDatePickerStyle = .inline
        picker.backgroundColor = .clear
        picker.datePickerMode = .time
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    lazy var tableDelegate:TableHourDelegate = {
       let delegate = TableHourDelegate()
        return delegate
    }()
    
    lazy var tableDataSource:TableHourDataSource = {
        let dataSource = TableHourDataSource()
        return dataSource
    }()
    
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.isUserInteractionEnabled = true
        tableView.register(AlertViewCell.self, forCellReuseIdentifier: AlertViewCell.reuseIdentiferCell)
        tableView.backgroundColor = .clear
        tableView.automaticallyAdjustsScrollIndicatorInsets = false
        tableView.separatorColor = .clear
        tableView.contentInset = .zero
        tableView.tableFooterView = UIView()
        tableView.delegate = tableDelegate
        tableView.dataSource = tableDataSource
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        let colorBack = UIColor(red: 41/255.0, green: 42/255.0, blue: 48/255.0, alpha: 1.0)
        backgroundColor = colorBack
        self.isUserInteractionEnabled = true
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlertsView:ViewCodable {
    func setupViewHierarchy() {
        self.addSubview(title)
        self.addSubview(subTitle)
        self.addSubview(addAlarmView)
        self.addSubview(addHourAlert)
        self.addSubview(tableView)
        
        //Suplementary View
        addAlarmView.addArrangedSubview(titleAlarmView)
        addAlarmView.addArrangedSubview(pickerAlarmView)
        
        addHourAlert.addSubview(backAddHourAlert)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor,constant: 20),
            title.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor,constant: 20),
            subTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            addHourAlert.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            addHourAlert.topAnchor.constraint(equalTo: self.subTitle.bottomAnchor,constant: 10),
            addHourAlert.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.09),
        ])
        
        NSLayoutConstraint.activate([
            backAddHourAlert.widthAnchor.constraint(equalTo: addHourAlert.widthAnchor, multiplier: 0.8),
            backAddHourAlert.heightAnchor.constraint(equalTo: addHourAlert.heightAnchor, multiplier: 0.55),
            backAddHourAlert.centerXAnchor.constraint(equalTo: addHourAlert.centerXAnchor),
            backAddHourAlert.centerYAnchor.constraint(equalTo: addHourAlert.centerYAnchor),
        ])
        NSLayoutConstraint.activate([
            addAlarmView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            addAlarmView.trailingAnchor.constraint(equalTo: self.addHourAlert.leadingAnchor),
            addAlarmView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            addAlarmView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.09),
            addAlarmView.topAnchor.constraint(equalTo: self.subTitle.bottomAnchor,constant: 10),
        ])
        
    
        let constraintTitleAlarmView = titleAlarmView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 10)
        constraintTitleAlarmView.priority = UILayoutPriority(999)
        constraintTitleAlarmView.isActive = true
        
        let pickerAlarmTrailingAnchor = pickerAlarmView.trailingAnchor.constraint(equalTo: addHourAlert.leadingAnchor, constant: -0.3)
        pickerAlarmTrailingAnchor.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            pickerAlarmView.widthAnchor.constraint(equalTo: addAlarmView.widthAnchor, multiplier: 0.3),
            pickerAlarmTrailingAnchor,
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: addAlarmView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor)
        ])
    }
}
