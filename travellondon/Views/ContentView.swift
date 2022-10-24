//
//  ContentView.swift
//  travellondon
//
//  Created by Tony Cheung on 17/10/2022.
//

import SwiftUI

enum SelectedTab { case explorer, categories, saved, transport, more}

struct ContentView: View {
    
    @EnvironmentObject var setting: Setting
    @EnvironmentObject var viewControlSetting: ViewControlSetting
    
    @State var selectedTab: SelectedTab = .explorer
    
    let tabItemMenu = ["explorer", "categories", "saved", "transport", "more"]
    var tabItemImage: [String] {
        tabItemMenu.map{getTabItemImageName(imageName: $0, selectedTab: self.selectedTab)}
    }
    var tabItemString: [String] {
        tabItemMenu.map{localizedString(key:"tabbar_" + $0, language:setting.appLanguage)}
    }
    
    init() {
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().barTintColor = .black
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    }
    
    private func getTabItemImageName(imageName:String, selectedTab:SelectedTab) -> String {
        switch (selectedTab) {
        case .explorer:
            return imageName == "explorer" ? imageName + "_selected" : imageName;
        case .categories:
            return imageName == "categories" ? imageName + "_selected" : imageName;
        case .saved:
            return imageName == "saved" ? imageName + "_selected" : imageName;
        case .transport:
            return imageName == "transport" ? imageName + "_selected" : imageName;
        case .more:
            return imageName == "more" ? imageName + "_selected" : imageName;
        }
    }
    
    private func getSafeAreaTop() -> CGFloat {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window?.safeAreaInsets.top ?? 0
    }
    
    var body: some View {
        
        ZStack() {
            
            Color.black.ignoresSafeArea(.all)
            
            VStack(spacing:0) {
                
                NavigationBar()
                     .padding(.top, getSafeAreaTop())
                     .background(.red)
                
                TabView(selection: $selectedTab) {
                    ExplorerView()
                        .id(viewControlSetting.explorerRootViewId)
                        .tabItem {
                            VStack{
                                Image(tabItemImage[0])
                                Text(tabItemString[0])
                            }
                        }
                        .tag(SelectedTab.explorer)
                        .onChange(of: selectedTab) { newValue in
                            viewControlSetting.explorerRootViewId = UUID()
                        }
                    CategoriesView()
                        .tabItem {
                            VStack{
                                Image(tabItemImage[1])
                                Text(tabItemString[1])
                            }
                        }.tag(SelectedTab.categories)
                        .onChange(of: selectedTab) { newValue in
                            viewControlSetting.caategoriesRootViewId = UUID()
                        }
                    TabView2().tabItem {
                        VStack{
                            Image(tabItemImage[2])
                            Text(tabItemString[2])
                        }
                    }.tag(SelectedTab.saved)
                    TabView2().tabItem {
                        VStack{
                            Image(tabItemImage[3])
                            Text(tabItemString[3])
                        }
                    }.tag(SelectedTab.transport)
                    MoreView().tabItem {
                        VStack{
                            Image(tabItemImage[4])
                            Text(tabItemString[4])
                        }
                    }
                    .tag(SelectedTab.more)
                }
            }
            .environmentObject(setting)
        }.ignoresSafeArea(.all, edges: .top)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let setting = Setting()
        ContentView().environmentObject(setting)
    }
}
