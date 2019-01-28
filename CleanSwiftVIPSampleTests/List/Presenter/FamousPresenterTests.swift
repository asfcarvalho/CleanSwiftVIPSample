//
//  FamousPresenterTests.swift
//  CleanSwiftVIPSampleTests
//
//  Created by Anderson Carvalho on 28/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import XCTest
@testable import CleanSwiftVIPSample

class FamousPresenterTests: XCTestCase {
    
    var viewController: MockViewController!
    var interactor: MockInteractor!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        interactor = MockInteractor()
        viewController = MockViewController()
        interactor.presenter = viewController
    }

    override func tearDown() {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    class MockInteractor: FamousInteractorInputProtocol {
        var worker: FamousWorkerInputProntocol?
        
        var presenter: FamouseInteractorOutputProtocol?
        
        func showListOfFamous() {
            presenter?.showListOfFamous([Famous]())
            presenter?.showError("error")
        }
        
        func viewDidLoad() {
            
        }
    }
    
    class MockViewController: FamouseInteractorOutputProtocol {
        
        var famous: [Famous]?
        var error: String?
        
        func showListOfFamous(_ famous: [Famous]) {
            self.famous = famous
        }
        
        func showError(_ eror: String) {
            self.error = eror
        }
        
        func viewDidLoad() {
            
        }
        
        
    }
    
    func testListSuccess() {
        interactor.showListOfFamous()
        XCTAssertTrue(viewController.famous != nil)
        XCTAssertFalse(viewController.error != "error")
    }
    
    func testShowError() {
        interactor.showListOfFamous()
        XCTAssertFalse(viewController.famous == nil)
        XCTAssertTrue(viewController.error == "error")
    }
}
