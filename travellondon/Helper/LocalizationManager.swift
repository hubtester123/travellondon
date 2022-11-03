//
//  LocalizationManager.swift
//  travellondon
//
//  Created by Tony Cheung on 19/10/2022.
//

import Foundation

func localizedString(key:String, language:String = "", defaultResult:String? = nil) -> String {
    
    guard let url = getBundleURL(language: language) else { return defaultResult == nil ? key : defaultResult! }
    
    guard let stringDictionary = NSDictionary(contentsOf: url) as? [String: String] else { return defaultResult == nil ? key : defaultResult! }
            
    guard let result = stringDictionary[key] else { return defaultResult == nil ? key : defaultResult!  }
    
    return result
}

fileprivate func getBundleURL(language:String) -> URL? {
    
    let resourceName:String = "Localizable" + "_" + language
    return Bundle.main.url(forResource: resourceName, withExtension: "strings")
}

