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
    

    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = "$0.00"
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let formatterForCurrency = NSNumberFormatter()
        formatterForCurrency.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        formatterForCurrency.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        
        let currentText = textField.text!
        let currentValue = formatterForCurrency.numberFromString(currentText)!.doubleValue
        var resultValue = currentValue
        var resultText = textField.text

        if string == "" {
            resultText = resultText!.substringToIndex(resultText!.endIndex.advancedBy(-1))
            resultValue = formatterForCurrency.numberFromString(resultText!)!.doubleValue
            resultValue = resultValue / 10
            
            resultText = formatterForCurrency.stringFromNumber(resultValue as NSNumber)
            resultText = resultText! + " "
            textField.text = resultText
        } else {
            resultValue = currentValue * 10
            resultText = formatterForCurrency.stringFromNumber(resultValue as NSNumber)
            resultText = resultText!.substringToIndex(resultText!.endIndex.advancedBy(-1))
            textField.text = resultText
        }
        return true
    }
}