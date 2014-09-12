//
//  ViewController.swift
//  MyTipd
//
//  Created by Yee Wong on 08/09/2014.
//  Copyright (c) 2014 www.bitditgit.com. All rights reserved.
//

import UIKit

// Return the string format of a currency as the number of pennies. 12345 returns "123.45"
extension Int {
    var currencyString: String {
        switch self {
        case 0:
            return "0.00"
        case 1...9 :
            return "0.0\(self)"
        case let x where self % 100 == 0:   // case for amount with 2 trailing 0s, e.g. 1100
            return "\(self / 100).00"
        default:
            return "\(self / 100).\(self % 100)"
            }
    }
}

public class MyViewController: UIViewController {
    
    @IBOutlet public weak var billAmountTextField: UITextField!
    @IBOutlet public weak var tipPctSegment: UISegmentedControl!
    @IBOutlet public weak var tipAmountTextField: UITextField!
    @IBOutlet public weak var totalAmountTextField: UITextField!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.displayTheKeyboard()
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func displayTheKeyboard() {
        self.billAmountTextField.becomeFirstResponder()
    }
    
    private func dismissTheKeyboard() {
        self.billAmountTextField.resignFirstResponder()
    }
    
    public func displayTotalAmount(amount: Int) {
         self.totalAmountTextField.text = amount.currencyString
    }
    
    public func displayTipAmount(amount: Int) {
        self.tipAmountTextField.text = amount.currencyString
    }

    // reads the label text on the segment, covert that to an integer using .integerValue which ignores any extraneous text characters. this function will still work if you change the percentage on the label to another number
    public func calTipPercentageForSegment(segment: Int) -> Int{
        var pctString = self.tipPctSegment.titleForSegmentAtIndex(segment)! as NSString
        return pctString.integerValue
    }
    
    public func getBillAmount() -> Int {
        var billAmount = Int((self.billAmountTextField.text as NSString).floatValue * 100.0)
        return billAmount
    }
    
    // we have to convert to float to do the calculation so we can use lroundf to round of the last penny.
    public func calTipAmount(amount: Int, percentage: Int) -> Int {
        var tip = Int(lroundf(Float(amount) * Float(percentage) / 100.0))
        return tip
    }
    //    private func calTipAmount(pctCatergory: Int) -> Int {
    //        switch pctCatergory {
    //        case 0:
    //            return 5
    //        case 1:
    //            return 10
    //        case 2:
    //            return 15
    //        case 3:
    //            return 20
    //        default:
    //            return 25
    //        }
    //    }
    
    public func updateTipDisplay() {
        var billAmount = getBillAmount()
        var tipPecentage = calTipPercentageForSegment(tipPctSegment.selectedSegmentIndex)
        var tipAmount = calTipAmount(billAmount, percentage: tipPecentage)
        displayTipAmount(tipAmount)
    }
    
    public func updateTotalDisplay() {
        var billAmount = getBillAmount()
        var tipPecentage = calTipPercentageForSegment(tipPctSegment.selectedSegmentIndex)
        var tipAmount = calTipAmount(billAmount, percentage: tipPecentage)
        displayTipAmount(tipAmount)
        var total = getBillAmount() + tipAmount
        displayTotalAmount(total)
    }
    
    @IBAction func tipPctChanged(sender: AnyObject) {
        self.dismissTheKeyboard()
        updateTipDisplay()
        updateTotalDisplay()
    }
    
//    private func displayResult() {
//        self.totalAmountTextField.text = totalAmount.currencyString
//        self.tipAmountTextField.text = tipAmount.currencyString
//    }
//
//    func calculateTipAndTotal() {
//        var billAmount = getBillAmountAsInt()
//        tipAmount = calTipAmountAsInt(billAmount)
//        totalAmount = billAmount + tipAmount
//        displayResult()
//    }
//    
//    @IBAction func tipPctChanged(sender: AnyObject) {
//        self.dismissTheKeyboard()
//        var tipCategory = (sender as UISegmentedControl).selectedSegmentIndex
//        tipPct = calTipPct(tipCategory)
//        calculateTipAndTotal()
//    }
//    
//    private func getBillAmountAsInt() -> Int {
//        let billAmount = (billAmountTextField.text as NSString).integerValue
//        return billAmount
//    }
//    
//    // calculates the tip amount based on the tip pecentage
//    // formula for percentage: Float(number) * percentage / 100
//    private func calTipAmountAsInt(amount: Int) -> Int {
//        return Int(lroundf(Float(amount) * Float(tipPct) / 100))
//    }
//    

 }

