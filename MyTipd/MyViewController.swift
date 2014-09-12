//
//  ViewController.swift
//  MyTipd
//
//  Created by Yee Wong on 08/09/2014.
//  Copyright (c) 2014 www.bitditgit.com. All rights reserved.
//

import UIKit

// Return the string representation of an int currency format. 12345:Int returns "123.45"
extension Int {
    var currencyString: String {
        switch self {
        case 0:
            return "0.00"
        case 1...9 :
            return "0.0\(self)"
        default:
            return "\(self / 100).\(self % 100)"
            }
    }
}

public class MyViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPctSegment: UISegmentedControl!
    @IBOutlet weak var tipAmountTextField: UITextField!
    @IBOutlet weak var totalAmountTextField: UITextField!
    
    private var tipPct = 0
    private var tipAmount = 0
    private var totalAmount = 0
    
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

    @IBAction func tipPctChanged(sender: AnyObject) {
        self.dismissTheKeyboard()
        var tipCategory = (sender as UISegmentedControl).selectedSegmentIndex
        tipPct = calTipPct(tipCategory)
        calculateTipAndTotal()
    }
    
    func calculateTipAndTotal() {
        var billAmount = getBillAmountAsInt()
        tipAmount = calTipAmountAsInt(billAmount)
        totalAmount = billAmount + tipAmount
        displayResult()
    }
    
    private func displayResult() {
        self.totalAmountTextField.text = totalAmount.currencyString
        self.tipAmountTextField.text = tipAmount.currencyString
    }
    
    // calculates the tip amount based on the tip pecentage
    // formula for percentage: Float(number) * percentage / 100
    private func calTipAmountAsInt(amount: Int) -> Int {
        return Int(lroundf(Float(amount) * Float(tipPct) / 100))
    }
    
    private func getBillAmountAsInt() -> Int {
        let billAmountAsFloat = (billAmountTextField.text as NSString).floatValue
        let billAmountAsInt = Int(billAmountAsFloat * 100.0)
        return billAmountAsInt
    }
    
    private func calTipPct(pctCatergory: Int) -> Int {
        switch pctCatergory {
        case 0:
            return 5
        case 1:
            return 10
        case 2:
            return 15
        case 3:
            return 20
        default:
            return 25
        }
    }
 }

