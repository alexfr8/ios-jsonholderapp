//
//  XCTest+Extensions.swift
//  Json Holder AppTests
//
//  Created by Alejandro Fernández Ruiz on 26/11/2019.
//  Copyright © 2019 Alejandro Fernández Ruiz. All rights reserved.
//

import XCTest

extension XCTestCase {

    func waitUI(withDelay: Double = 0) {
        let uiExpectation = expectation(description: "UI Waiting")
        DispatchQueue.main.asyncAfter(deadline: .now() + withDelay + 0.2) {
            uiExpectation.fulfill()
        }
        waitForExpectations(timeout: withDelay + 1, handler: nil)
    }
}
