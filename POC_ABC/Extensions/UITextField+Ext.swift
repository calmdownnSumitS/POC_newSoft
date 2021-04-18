//
//  UITextField+Ext.swift
//  POC_ABC
//
//  Created by Sumit_sharma on 18/04/21.
//

import Foundation
import UIKit

private var __maxLengths = [UITextField: Int]()
extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
               return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        let txt = textField.text?.prefix(maxLength)
        textField.text = String(txt ?? "")
    }
}
