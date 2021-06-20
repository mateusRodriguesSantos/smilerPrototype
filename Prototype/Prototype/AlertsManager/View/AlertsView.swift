//
//  AlertsView.swift
//  Smiler
//
//  Created by Mateus Rodrigues on 02/04/21.
//

import UIKit
import NatDS
import NatDSIcons
import TinyConstraints

class AlertsView:UIView {
    
    //MARK: NavBar
    
    lazy var icon:NatIconButton = {
        let icon = NatIconButton(style: .standardDefault)
        icon.configure(icon: getIcon(.outlinedActionEdit))
        return icon
    }()
    
    lazy var navBar: AppNavigationBar = {
        let navigation = AppNavigationBar(title: .text("Editar Alertas"), leftButton: .back, rightButtons: [icon])
       
        return navigation
    }()

    //MARK: Title and SubTitle
    
    let title:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Horários de alerta"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = NatFonts.fontRoboto(ofSize: .heading4, withWeight: .regular)
        label.textColor = NatColors.highEmphasis
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Adicionar"
        label.numberOfLines = 0
        label.font = NatFonts.fontRoboto(ofSize: .body1, withWeight: .bold)
        label.textAlignment = .left
        label.textColor = NatColors.highEmphasis
        return label
    }()
    
    //MARK: Alarm
    let addHourAlertButton:FeedbackButton = {
        let button = FeedbackButton()
        button.backgroundColor = NatColors.surface
        button.setTitleColor(.white, for: .normal)
        button.badgeTextColor = .white
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.white.cgColor
        button.setTitle("+", for: .normal)
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.font = NatFonts.fontRoboto(ofSize: .heading6, withWeight: .regular)
        button.visualFeedback = true
        return button
    }()
    
    let backAddHourAlert:UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = NatColors.highEmphasis
        view.layer.cornerRadius = 6
        view.alpha = 0.2
        view.isUserInteractionEnabled = false
        return view
    }()
    
    //MARK: --StackView
    
    lazy var addAlarmView:UIStackView = {
        let view = UIStackView(frame: .zero)
        view.backgroundColor = NatColors.surface
        view.alignment = .center
        view.axis = .horizontal
        view.distribution = .fill
        view.layer.cornerRadius = 5
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let titleAlarmViewLabel:UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Hora"
        label.numberOfLines = 0
        label.font = NatFonts.fontRoboto(ofSize: .heading5, withWeight: .regular)
        label.textAlignment = .left
        label.textColor = NatColors.highEmphasis
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var pickerAlarmView:UIDatePicker = {
        let picker = UIDatePicker()
        picker.locale = Locale(identifier: "en_BR")
        picker.preferredDatePickerStyle = .inline
        picker.backgroundColor = .clear
        picker.tintColor = .white
        picker.setValue(UIColor.white, forKeyPath: "textColor")
        picker.datePickerMode = .time
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    //MARK: TableView
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
        tableView.layer.cornerRadius = 5
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
        self.isUserInteractionEnabled = true
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AlertsView:ViewCodable {
    func setupViewHierarchy() {
        self.addSubview(navBar)
        self.addSubview(title)
        self.addSubview(subTitle)
        self.addSubview(addHourAlertButton)
        self.addSubview(addAlarmView)
        self.addSubview(tableView)
        
        //Suplementary View
        addAlarmView.addArrangedSubview(titleAlarmViewLabel)
        addAlarmView.addArrangedSubview(pickerAlarmView)
        
        //addHourAlertButton.addSubview(backAddHourAlert)
    }
    
    func setupAditionalConfiguration() {
        self.backgroundColor = NatColors.background
    }
    
    func setupConstraints() {
        
        title.topToBottom(of: navBar,offset: NatSpacing.small)
        title.centerXToSuperview()
        title.leadingToSuperview()
        title.trailingToSuperview()
        
        subTitle.topToBottom(of: title,offset: NatSpacing.small)
        subTitle.leadingToSuperview(offset: NatSpacing.tiny)
        
   
        
        addAlarmView.leftToSuperview(offset:-5)
        addAlarmView.topToBottom(of: subTitle,offset: NatSpacing.tiny)
        
        titleAlarmViewLabel.leadingToSuperview(offset:NatSpacing.standard)
        
  
        addHourAlertButton.topToBottom(of: subTitle,offset: NatSpacing.tiny)
        addHourAlertButton.leadingToTrailing(of: addAlarmView,offset: NatSpacing.small)
        addHourAlertButton.trailingToSuperview(offset: NatSpacing.small)
        addHourAlertButton.heightAnchor.constraint(equalTo: addAlarmView.heightAnchor).isActive = true
  
        
        let pickerAlarmTrailingAnchor = pickerAlarmView.trailingAnchor.constraint(equalTo: addHourAlertButton.leadingAnchor, constant: -0.3)
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
