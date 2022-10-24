//
//  travellondonApp.swift
//  travellondon
//
//  Created by Tony Cheung on 17/10/2022.
//

import SwiftUI

@main
struct travellondonApp: App {
    
    @StateObject private var setting = Setting()
    @ObservedObject private var viewControlSetting = ViewControlSetting()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(setting)
                .environmentObject(viewControlSetting)
        }
    }
}
