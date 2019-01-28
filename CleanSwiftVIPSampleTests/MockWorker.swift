//
//  MockWorker.swift
//  CleanSwiftVIPSampleTests
//
//  Created by Anderson Carvalho on 18/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import Foundation
@testable import CleanSwiftVIPSample

class MockWorker: FamousWorkerInputProntocol {
    var interactor: FamousWorkerOutputProntocol?
    
    func fetchFamous() {
        interactor?.showListOfFamous([Famous]())
        interactor?.onError("error")
    }
}
