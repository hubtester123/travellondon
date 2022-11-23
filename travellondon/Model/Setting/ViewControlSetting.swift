//
//  ViewControlSetting.swift
//  travellondon
//
//  Created by Tony Cheung on 23/10/2022.
//

import Foundation

class ViewControlSetting: ObservableObject {
        
    @Published var explorerRootViewId = UUID()
    @Published var categoriesRootViewId = UUID()
    
    func refreshTabView() {
        explorerRootViewId = UUID()
        categoriesRootViewId = UUID()
    }
}
