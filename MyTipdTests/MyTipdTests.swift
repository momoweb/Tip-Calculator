//
//  MyTipdTests.swift
//  MyTipdTests
//
//  Created by Yee Wong on 08/09/2014.
//  Copyright (c) 2014 www.bitditgit.com. All rights reserved.
//

import UIKit
import XCTest
import MyTipd

class MyTipdTests: XCTestCase {
    
    var vc: MyTipd.MyViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
        vc = storyboard.instantiateInitialViewController() as MyTipd.MyViewController
        vc.loadView()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testDisplayTotalAmountFOr0() {
//        vc.displayTotalAmount(0)
//        let result = vc.billAmountTextField.text
//        XCTAssertEqual(result, "£0.00")
//    }
    
    func testVCInstiantiates() {
        XCTAssertNotNil(vc)
    }
    
//    func testDisplayTotalAmountFor0() {
//        self.vc.displayTotalAmount(0)
//        let result = self.vc.bi
//        XCTAssertEqual(
//    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
