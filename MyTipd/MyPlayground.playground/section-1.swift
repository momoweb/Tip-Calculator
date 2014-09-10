// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

extension Int {
    var currencyFormatString: String {
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
let f: String = "12.235"
let billAsFloatD = (f as NSString).floatValue
let intVersion = Int(billAsFloatD * 100.0)

let pct = Int(lroundf(Float(intVersion) * 50 / 100))

let test = ceil(12.1)

//private func getBillAmountAsInt() -> Int {
//    let billAsFloat = (f as NSString).floatValue
//    let wholeNumber = billAsFloat / 1
//    let decimal = (billAsFloat - wholeNumber) * 100
//    let result = wholeNumber * 100 + decimal
//    return result
//}
