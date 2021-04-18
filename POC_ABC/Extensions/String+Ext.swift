//
//  String+Ext.swift
//  POC_ABC
//
//  Created by Sumit_sharma on 17/04/21.
//

import Foundation
import UIKit
extension String {
    public var isEmail: Bool {
            let dataDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)

            let firstMatch = dataDetector?.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSRange(location: 0, length: length))

            return (firstMatch?.range.location != NSNotFound && firstMatch?.url?.scheme == "mailto")
        }

        public var length: Int {
            return self.count
        }
}




