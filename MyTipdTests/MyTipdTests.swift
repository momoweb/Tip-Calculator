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
        self.vc = storyboard.instantiateInitialViewController() as MyTipd.MyViewController
        self.vc.loadView()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testVCInstiantiates() {
        XCTAssertNotNil(self.vc)
    }
    
    func testDisplayTotalAmountFor0() {
        vc.displayTotalAmount(0)
        let result = vc.totalAmountTextField.text
        XCTAssertEqual(result, "0.00")
    }
    
    func testDisplayTotalAmountFor1234() {
        vc.displayTotalAmount(1234)
        let result = vc.totalAmountTextField.text
        XCTAssertEqual(result, "12.34")
    }
    
    func testDisplayTipAmountFor431() {
        vc.displayTipAmount(431)
        let result = vc.tipAmountTextField.text
        XCTAssertEqual(result, "4.31")
    }
    
    func testPecentageFromSegment0() {
        var percent = vc.calTipPercentageForSegment(0)
        XCTAssertEqual(percent, 5, "percent returned is: \(percent)")
    }
    
    func testPecentageFromSegment3() {
        var percent = vc.calTipPercentageForSegment(3)
        XCTAssertEqual(percent, 20, "percent returned is: \(percent)")
    }
    
    func testReadBillAmountWhenBlank() {
        var billAmount = vc.getBillAmount()
        XCTAssertEqual(billAmount, 0, "billAmount is: \(billAmount)")
    }

    func testReadBillAmountWhen11point23() {
        vc.billAmountTextField.text = "11.23"
        var billAmount = vc.getBillAmount()
        XCTAssertEqual(billAmount, 1123, "billAmount is: \(billAmount)")
    }
    
    func testReadBillAmountWhen22point33point45() {
        vc.billAmountTextField.text = "22.33.45"
        var billAmount = vc.getBillAmount()
        XCTAssertEqual(billAmount, 2233, "billAmount is: \(billAmount)")
    }
    
    // testing £100 (10000 penny)
    func testCalTipAmountFor10000_10pct() {
        var tip = vc.calTipAmount(10000, percentage: 10)
        XCTAssertEqual(tip, 1000, "tip returned is: \(tip)")
    }
    
    func testCalTipAmountFor1123_20pct() {
        var tip = vc.calTipAmount(1123, percentage: 20)
        XCTAssertEqual(tip, 225, "tip returned is: \(tip)")
    }
    
    func testUpdateDisplayTipFor0(){
        vc.billAmountTextField.text = "0"
        vc.tipPctSegment.selectedSegmentIndex = 1
        vc.updateTipDisplay()
        var tipDisplay = vc.tipAmountTextField.text
        XCTAssertEqual(tipDisplay, "0.00", "tip display shows: \(tipDisplay)")
    }
    
    func testUpdateTipDisplayFor100_20Pct(){
        vc.billAmountTextField.text = "1.00"
        vc.tipPctSegment.selectedSegmentIndex = 3
        vc.updateTipDisplay()
        var tipDisplay = vc.tipAmountTextField.text
        XCTAssertEqual(tipDisplay, "0.20", "tip display shows: \(tipDisplay)")
    }
    
    func testUpdateTotalDisplayForBillAmount0() {
        vc.billAmountTextField.text = "0"
        vc.tipPctSegment.selectedSegmentIndex = 1
        vc.updateTotalDisplay()
        var total = vc.totalAmountTextField.text
        XCTAssertEqual(total, "0.00", "total display shows: \(total)")
    }
    
    func testUpdateTotalDisplayForBillAmount1000_10Pct() {
        vc.billAmountTextField.text = "10.00"
        vc.tipPctSegment.selectedSegmentIndex = 1
        vc.updateTotalDisplay()
        var total = vc.totalAmountTextField.text
        XCTAssertEqual(total, "11.00", "total display shows: \(total)")
    }
}
