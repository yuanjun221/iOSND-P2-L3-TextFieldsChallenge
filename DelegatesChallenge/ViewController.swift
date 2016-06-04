//
//  ViewController.swift
//  DelegatesChallenge
//
//  Created by Jun.Yuan on 16/6/4.
//  Copyright © 2016年 Jun.Yuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockableTextField: UITextField!
    @IBOutlet weak var lockSwitch: UISwitch!
    
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashTextDelegate = CashTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zipCodeTextField.delegate = zipCodeDelegate
        cashTextField.delegate = cashTextDelegate
        lockableTextField.delegate = self
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return lockSwitch.on
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        lockableTextField.resignFirstResponder()
        return true
    }
}

