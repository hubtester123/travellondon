//
//  NavigationBar.swift
//  travellondon
//
//  Created by Tony Cheung on 17/10/2022.
//

import SwiftUI

struct NavigationBar: View {
    
    @EnvironmentObject var setting: Setting
    
    var body: some View {
        HStack {
            Spacer()
            Text(localizedString(key:"bar_title", language:setting.appLanguage))
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            Spacer()
        }.background(Color.red)
            .frame(height:44.0)
        
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        let setting = Setting()
        NavigationBar().environmentObject(setting)
    }
}



