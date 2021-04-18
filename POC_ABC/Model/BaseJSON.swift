//
//  BaseJSON.swift
//  POC_ABC
//
//  Created by Sumit_sharma on 17/04/21.
//

import Foundation
struct JSONDATE<T>:Decodable where T: Decodable {
    var Data: [T]
}
