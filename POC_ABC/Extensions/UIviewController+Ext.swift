//
//  UIviewController+Ext.swift
//  POC_ABC
//
//  Created by Sumit_sharma on 17/04/21.
//

import Foundation
import UIKit
extension UIViewController{
    func loadJson<T:Decodable>(filename fileName: String,completion: @escaping (T?, _ error:String?) -> ()) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                completion(jsonData, nil)
            } catch {
                print("error:\(error)")
            }
        }else{
            completion(nil,"FILE NOT EXIST")
        }
    }
}
