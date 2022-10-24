//
//  Setting.swift
//  travellondon
//
//  Created by Tony Cheung on 20/10/2022.
//

import SwiftUI

class Setting: ObservableObject {
        
    @Published var appLanguage:String {
        didSet {
            UserDefaults.standard.setValue(appLanguage, forKey: "appLanguage")
        }
    }
    
    @Published var isLowData: Bool {
        didSet {
            UserDefaults.standard.setValue(isLowData, forKey: "isLowData")
        }
    }
    
    init() {
        appLanguage =  UserDefaults.standard.string(forKey: "appLanguage") ?? "en"
        isLowData = UserDefaults.standard.bool(forKey: "isLowData")
    }
}

