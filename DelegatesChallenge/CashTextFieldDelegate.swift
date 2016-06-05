//
//  CashTextFieldDelegate.swift
//  DelegatesChallenge
//
//  Created by Jun.Yuan on 16/6/4.
//  Copyright © 2016年 Jun.Yuan. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    private lazy var formatter: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        return formatter
    }()
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = "$0.00"
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text!
        let currentValue = formatter.numberFromString(currentText)!.doubleValue
        
        var resultText = currentText
        var resultValue = currentValue
        
        if string == "" {
            resultText = resultText.substringToIndex(resultText.endIndex.advancedBy(-1))
            resultValue = formatter.numberFromString(resultText)!.doubleValue
            resultValue = resultValue / 10
            
            resultText = formatter.stringFromNumber(resultValue as NSNumber)!
            resultText = resultText + " "
            textField.text = resultText
        } else {
            resultValue = currentValue * 10
            resultText = formatter.stringFromNumber(resultValue as NSNumber)!
            resultText = resultText.substringToIndex(resultText.endIndex.advancedBy(-1))
            textField.text = resultText
        }
        return true
    }
}