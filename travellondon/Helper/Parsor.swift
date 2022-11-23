//
//  Parsor.swift
//  travellondon
//
//  Created by Tony Cheung on 10/11/2022.
//

import Foundation

func parseJSON<T:ParseProtocol>(_ type:T.Type, from data: Data) throws -> Any? {
    
    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
    if let jsonObjectArray = jsonObject as? [[String:Any]] {
        return jsonObjectArray.map{ type.init($0) }
    }
    if let jsonObject = jsonObject as? [String:Any] {
        return type.init(jsonObject)
    }
    return nil
}
