//
//  MoreView.swift
//  travellondon
//
//  Created by Tony Cheung on 19/10/2022.
//

import SwiftUI

struct MoreView: View {
    
    @EnvironmentObject var setting: Setting
    
    private var titleArray = ["more_about_us",
                              "more_faq",
                              "more_terms_and_condition",
                              "more_rate_at_appstore",
                              "more_licesnses"]
    
    private var appLanguageArray = ["en",
                                    "zh"]
    private func getDisplayLanguage(language:String) -> String {
        switch language {
        case "en":
            return "English"
        case "zh":
            return "中文"
        default:
            return ""
        }
    }
    
    init() {
        UISwitch.appearance().onTintColor = .red

        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some View {
        
        List() {
            
            ForEach(titleArray, id: \.self) { title in
                Text(localizedString(key:title, language:setting.appLanguage))
                    .listRowBackground(Color.black)
                    .foregroundColor(Color.white)
                    .listRowSeparatorTint(Color(red: 0.541, green: 0.541, blue: 0.55))
            }
            
            Picker(localizedString(key:"more_language", language:setting.appLanguage), selection: $setting.appLanguage) {
                  ForEach(appLanguageArray, id: \.self) {
                      Text(getDisplayLanguage(language:$0))
                          .accessibilityIdentifier($0)
                  }
            }
            .listRowBackground(Color.black)
            .foregroundColor(Color.white)
            .listRowSeparatorTint(Color(red: 0.541, green: 0.541, blue: 0.55))
            .accessibilityIdentifier("languagePicker")
            

            Toggle(isOn: $setting.isLowData) {
                VStack {
                    HStack {
                        Text(localizedString(key:"more_low_data", language:setting.appLanguage))
                            .padding(.top, 20.0)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
       

                    Spacer()
                    
                    HStack {
                        Text(localizedString(key:"more_disable_videos_and_gifs", language:setting.appLanguage))
                            .font(.system(size:12))
                            .foregroundColor(Color.white)
                            .padding(.bottom, 20.0)
                        Spacer()
                    }
                }
            }
            .listRowBackground(Color.black)
            .tint(.red)
        }
        .listStyle(.inset)
        .background(appMainColor)
        .scrollContentBackground(.hidden)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
