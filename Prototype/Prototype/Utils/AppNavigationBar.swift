//
//  AppNavigationBar.swift
//  Smiler
//
//  Created by Mateus Augusto Moraes Ferreira on 28/05/21.
//

import Foundation
import UIKit
import TinyConstraints
import NatDS
import NatDSIcons

public class AppNavigationBar: UIView {
    public enum TitleType {
        case text(_ text: String)
        case image(_ image: UIImage?)
        case none
    }
    
    public enum LeftButtonType {
        case back
        case close
        case none
    }
    
    private let btnLeft = NatIconButton(style: .standardDefault)
    private let lblTitle = UILabel()
    private let imgTitle = UIImageView()
    private let stkRight = UIStackView()
    private var title: TitleType = .none
    private var leftButton: LeftButtonType = .none
    private var rightButtons: [UIView] = []
    private var leftButtonAction: (() -> ())?
    private let safeAreaView = UIView()
    private let navigationBarView = UIView()
    
    public func setTitle(_ title: String) {
        self.lblTitle.text = title
    }
    
    public func setImage(_ image: UIImage?) {
        self.imgTitle.image = image
    }
    
    public func setLeftButtonAction(_ action: @escaping () -> ()) {
        self.leftButtonAction = action
    }
    
    public func setRightButtons(_ buttons: [UIView]) {
        self.rightButtons = buttons
        self.stkRight.removeAllSubviews()
        self.rightButtons.forEach({button in
            self.stkRight.addArrangedSubview(button)
        })
    }
    
    //MARK: - Setup
    private func setupLayout() {
        guard self.superview != nil else {
            return
        }
        
        self.clipsToBounds = false
        
        self.addSubview(navigationBarView)
        self.addSubview(safeAreaView)
        self.navigationBarView.addSubview(self.btnLeft)
        self.navigationBarView.addSubview(self.lblTitle)
        self.navigationBarView.addSubview(self.imgTitle)
        self.navigationBarView.addSubview(self.stkRight)
        
        self.topToSuperview()
        self.leadingToSuperview()
        self.trailingToSuperview()
        
        self.safeAreaView.topToSuperview()
        self.safeAreaView.leadingToSuperview()
        self.safeAreaView.trailingToSuperview()
        self.safeAreaView.backgroundColor = NatColors.surface
        
        if #available(iOS 11.0, *), let window = UIWindow.key {
            self.safeAreaView.height(window.safeAreaInsets.top)
        } else {
            self.safeAreaView.height(0)
        }
        
        self.navigationBarView.topToBottom(of: self.safeAreaView)
        self.navigationBarView.bottomToSuperview()
        self.navigationBarView.leadingToSuperview()
        self.navigationBarView.trailingToSuperview()
        self.navigationBarView.height(NatSizes.mediumX)
        self.navigationBarView.backgroundColor = NatColors.surface
        self.navigationBarView.layer.shadowColor = NatColors.highlight.cgColor
        self.navigationBarView.layer.shadowOpacity = 0.15
        self.navigationBarView.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.navigationBarView.layer.shadowRadius = 2
        self.navigationBarView.layer.shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: UIWindow.key?.bounds.width ?? 320, height: NatSizes.mediumX)).cgPath
        self.navigationBarView.layer.shouldRasterize = true
        self.navigationBarView.layer.rasterizationScale = UIScreen.main.scale
        
        self.stkRight.height(NatSizes.semiX)
        self.stkRight.centerYToSuperview()
        self.stkRight.trailingToSuperview(offset: NatSpacing.small)
        self.stkRight.axis = .horizontal
        self.stkRight.alignment = .trailing
        self.stkRight.distribution = .fill
        self.stkRight.spacing = NatSpacing.tiny
        self.stkRight.arrangedSubviews.forEach({view in
            self.stkRight.removeArrangedSubview(view)
        })
        self.rightButtons.forEach({button in
            self.stkRight.addArrangedSubview(button)
        })
        
        self.lblTitle.centerYToSuperview()
        self.lblTitle.leadingToSuperview(offset: self.leftButton == .none ? NatSpacing.small : 72)
        self.lblTitle.trailingToLeading(of: self.stkRight, offset: NatSpacing.small)
        self.lblTitle.font = .robotoMedium(size: 20)
        self.lblTitle.textColor = NatColors.highEmphasis
        
        self.imgTitle.centerYToSuperview()
        self.imgTitle.leadingToSuperview(offset: self.leftButton == .none ? NatSpacing.small : 72)
        self.imgTitle.width(115)
        self.imgTitle.height(NatSizes.standard)
        self.imgTitle.contentMode = .scaleAspectFit
        
        switch self.title {
            case .text(let text):
                self.lblTitle.text = text
                self.lblTitle.isHidden = false
                self.imgTitle.isHidden = true
            case .image(let image):
                self.imgTitle.image = image
                self.lblTitle.isHidden = true
                self.imgTitle.isHidden = false
            case .none:
                self.lblTitle.isHidden = true
                self.imgTitle.isHidden = true
        }
        
        self.btnLeft.centerYToSuperview()
        self.btnLeft.leadingToSuperview(offset: NatSpacing.small)
        self.btnLeft.width(NatSizes.semiX)
        self.btnLeft.height(NatSizes.semiX)
        self.btnLeft.configure(action: {
            self.leftButtonAction?()
        })
        
        switch self.leftButton {
            case .back:
                self.btnLeft.configure(icon: getIcon(.outlinedNavigationDirectionright))
            case .close:
                self.btnLeft.configure(icon: getIcon(.outlinedNavigationClose))
            case .none:
                self.btnLeft.isHidden = true
        }
        
        self.layoutSubviews()
    }
    
    private func getStackWidth() -> CGFloat {
        let separatorCount = self.rightButtons.count == 1 ? 0 : (self.rightButtons.count - 1)
        
        let itemsWidth: CGFloat = CGFloat(self.rightButtons.count) * NatSizes.semiX
        let separatorWidth: CGFloat = CGFloat(separatorCount) * 8.0
        
        return itemsWidth + separatorWidth
    }
    
    //MARK: - View Lifecycle
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setupLayout()
    }
    
    public init(title: TitleType = .none, leftButton: LeftButtonType = .none, rightButtons: [UIView] = []) {
        super.init(frame: .zero)
        
        self.title = title
        self.leftButton = leftButton
        self.rightButtons = rightButtons
    }
    
     required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
