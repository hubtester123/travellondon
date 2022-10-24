//
//  CategoriesView.swift
//  travellondon
//
//  Created by Tony Cheung on 18/10/2022.
//

import SwiftUI

enum Categories { case nearme, offers, mustsee, priceless, free}

struct CategoriesView: View {
    var body: some View {
        NavigationStack {
            List {
                VStack {
                    HStack {
                        ZStack {
                            NavigationLink(destination: ExplorerView()) {
                              EmptyView()
                            }.frame(width: 0)
                            .opacity(0)

                            Button(action: {
    
                            }, label: {
                                Image("nearme")
                                  .cornerRadius(5)
                            })
                        }
                    }
                    
                    HStack {
                        VStack {
                            NavigationLink(destination: MoreView()) {
                                  Image("offers")
                                    .cornerRadius(5)
                              }
                             Image("mustsee")
                                .cornerRadius(5)
                        }
                        
                        VStack {
                             Image("priceless")
                                .cornerRadius(5)
                            
                             Image("free")
                                .cornerRadius(5)
                        }
                    }
                }
            }.onTapGesture {
                 return
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
