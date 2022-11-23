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
        
        switch (navigationBarSetting.navigationBarMode) {
        case .defaultValue:
            navigationBarTitleOnly()
        case .categories:
            navigationBarTitleOnly()
        case .eventDetail:
            navigationBarEventDetail()
        }
    }
    
    private func navigationBarTitleOnly() -> some View {
        
        return HStack {
                Spacer()
                Text(localizedString(key:navigationBarSetting.navigationBarTitle, language:setting.appLanguage))
                    .font(navigationBarSetting.navigationBarFont)
                    .fontWeight(navigationBarSetting.navigationBarFontWeight)
                    .foregroundColor(Color.white)
                    .lineLimit(1)
                    .accessibilityIdentifier("navigationBarTitleLabel")
                Spacer()
            }.background(Color.red)
                .frame(height:44.0)
    }
    
    private func navigationBarEventDetail() -> some View {
        
        return HStack {
            
                Button {
                    navigationBarSetting.showEventDetail = false
                    navigationBarSetting.navigationBarMode = .defaultValue
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                }.padding([.leading, .trailing], 10)
                .accessibilityIdentifier("eventDetailNavigationBarBackButton")
                Spacer()
                Text(localizedString(key:navigationBarSetting.navigationBarTitle, language:setting.appLanguage))
                    .font(navigationBarSetting.navigationBarFont)
                    .fontWeight(navigationBarSetting.navigationBarFontWeight)
                    .foregroundColor(Color.white)
                    .lineLimit(1)
                    .accessibilityIdentifier("eventDetailNavigationBarTitleLabel")
                Spacer()
                Button {
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                }.padding(.leading, 10)
                .padding(.trailing, 5)
                .accessibilityIdentifier("eventDetailNavigationBarShareButton")
                Button {
                } label: {
                    Text("Map")
                        .foregroundColor(.white)
                }.padding(.leading, 5)
                .padding(.trailing, 10)
                .accessibilityIdentifier("eventDetailNavigationMapButton")
            }.background(Color.red)
                .frame(height:44.0)
        }
}

struct NavigationBar_Previews: PreviewProvider {
    
    static var setting = Setting()
    static var navigationBarSetting = NavigationBarSetting()
    
    static var eventDetailNavigationBarSetting = NavigationBarSetting(navigationBarMode: .eventDetail, customBarTitle: "The Lion King: The Musical ar the Lyceum Theatre")
    
    static var previews: some View {
        NavigationBar()
            .environmentObject(setting)
            .environmentObject(navigationBarSetting)
        
        NavigationBar()
            .environmentObject(setting)
            .environmentObject(eventDetailNavigationBarSetting)
    }
}



