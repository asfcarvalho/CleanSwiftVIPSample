//
//  FamousInteractorTests.swift
//  CleanSwiftVIPSampleTests
//
//  Created by Anderson Carvalho on 18/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import XCTest
@testable import CleanSwiftVIPSample

class FamousInteractorTests: XCTestCase {
    
    var mockWorker: MockWorker!
    var mockInteractor: MockInteractor!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        mockInteractor = MockInteractor()
        mockWorker = MockWorker()
        mockWorker.interactor = mockInteractor
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: FamousWorkerOutputProntocol {
        
        var famous: [Famous]?
        var error: String?
        
        func showListOfFamous(_ famous: [Famous]) {
            self.famous = famous
        }
        
        func onError(_ error: String) {
            self.error = error
        }
    }
    
    func testListSuccess() {
        mockWorker.fetchFamous()
        XCTAssertTrue(mockInteractor.famous != nil)
        XCTAssertFalse(mockInteractor.error != "error")
    }
    
    func testShowError() {
        mockWorker.fetchFamous()
        XCTAssertFalse(mockInteractor.famous == nil)
        XCTAssertTrue(mockInteractor.error == "error")
    }
}
