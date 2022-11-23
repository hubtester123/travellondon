//
//  NavigationBarSetting.swift
//  travellondon
//
//  Created by Tony Cheung on 26/10/2022.
//

import Foundation
import SwiftUI

enum NagvigationBarMode { case defaultValue, categories, eventDetail}


class NavigationBarSetting: ObservableObject {
        
    @Published var navigationBarMode:NagvigationBarMode = .defaultValue
    @Published var showEventDetail = false
    
    @Published var customBarTitle:String = ""
    
    var navigationBarTitle: String {
        switch (navigationBarMode) {
        case .defaultValue:
            return "bar_title"
        case .categories:
            return "bar_title_category"
        case .eventDetail:
            return customBarTitle
        }
    }
    
    var navigationBarFont:Font {
        switch (navigationBarMode) {
        case .defaultValue:
            return .largeTitle
        case .categories:
            return .headline
        case .eventDetail:
            return .headline
        }
    }
    
    var navigationBarFontWeight: Font.Weight {
        switch (navigationBarMode) {
        case .defaultValue:
            return .bold
        case .categories:
            return .medium
        case .eventDetail:
            return .medium
        }
    }
    
    init() {}
    
    init(navigationBarMode: NagvigationBarMode, showEventDetail: Bool = false, customBarTitle: String) {
        self.navigationBarMode = navigationBarMode
        self.customBarTitle = customBarTitle
    }
}
