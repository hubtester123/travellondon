//
//  NavigationBar.swift
//  travellondon
//
//  Created by Tony Cheung on 17/10/2022.
//

import SwiftUI

struct NavigationBar: View {
    
    @EnvironmentObject var setting: Setting
    @EnvironmentObject var navigationBarSetting: NavigationBarSetting

    
    var body: some View {
        HStack {
            Spacer()
            Text(localizedString(key:navigationBarSetting.navigationBarTitle, language:setting.appLanguage))
                .font(navigationBarSetting.navigationBarFont)
                .fontWeight(navigationBarSetting.navigationBarFontWeight)
                .foregroundColor(Color.white)
            Spacer()
            
        }.background(Color.red)
            .frame(height:44.0)
        
    }
}

//struct NavigationBar_Previews: PreviewProvider {
//
//   // @State var navigationBarSetting: NavigationBarSetting = NavigationBarSetting()
//
//    static var previews: some View {
//        let setting = Setting()
//        NavigationBar(navigationBarSetting: navigationBarSetting).environmentObject(setting)
//    }
//}



