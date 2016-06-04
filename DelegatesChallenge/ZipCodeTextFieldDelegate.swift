//
//  ZipCodeTextFieldDelegate.swift
//  DelegatesChallenge
//
//  Created by Jun.Yuan on 16/6/4.
//  Copyright © 2016年 Jun.Yuan. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var newText: NSString = textField.text!
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        if newText.length == 5 {
            textField.text = String(newText)
            textField.resignFirstResponder()
        }
        
        if newText.length > 5 {
            textField.resignFirstResponder()
            return false
        }
        
        return true
    }
}