//
//  MenuViewViewControllerTestCase.swift
//  SmilerTests
//
//  Created by Mateus Rodrigues on 02/04/21.
//
import Quick
import Nimble
import Nimble_Snapshots
@testable import Smiler

class MenuViewViewControllerTestCase:QuickSpec {
    
    override func spec() {
        
        describe("MenuViewViewController") {
            
            var controller:MenuViewController!
            
            beforeEach {
                controller = MenuViewController()
                controller.viewBase.translatesAutoresizingMaskIntoConstraints = false
                controller.viewBase.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
                controller.viewBase.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
            }
            
            it("record") {
                expect(controller) == snapshot()
            }
        }
    }
}

