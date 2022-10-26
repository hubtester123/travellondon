//
//  NavigationBarSetting.swift
//  travellondon
//
//  Created by Tony Cheung on 26/10/2022.
//

import Foundation
import SwiftUI

enum NagvigationBarMode { case defaultValue, categories}


class NavigationBarSetting: ObservableObject {
        
    @Published var navigationBarMode:NagvigationBarMode = .defaultValue
    
    var navigationBarTitle: String {
        switch (navigationBarMode) {
        case .defaultValue:
            return "bar_title"
        case .categories:
            return "bar_title_category"
        }
    }
    
    var navigationBarFont:Font {
        switch (navigationBarMode) {
        case .defaultValue:
            return .largeTitle
        case .categories:
            return .headline
        }
    }
    
    var navigationBarFontWeight: Font.Weight {
        switch (navigationBarMode) {
        case .defaultValue:
            return .bold
        case .categories:
            return .medium
        }
    }
    
}
