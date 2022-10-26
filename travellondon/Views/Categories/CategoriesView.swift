//
//  CategoriesView.swift
//  travellondon
//
//  Created by Tony Cheung on 18/10/2022.
//

import SwiftUI

enum Categories { case nearme, offers, mustsee, priceless, free}



struct CategoriesView: View {
        
    let categoryListViewModel = CategoryListViewModel()

    var body: some View {
        
        NavigationStack {
            List() {
                ForEach(categoryListViewModel.categories, id: \.self) {categoryArray in
                    CategoriesCellView(categories: categoryArray)
                            .listRowBackground(Color.clear)
                            .listRowInsets(EdgeInsets(top: 5.0, leading: 5.0, bottom: 0, trailing: 0))
                }
            }
            .listStyle(.inset)
            .background(appMainColor)
            .onTapGesture {
                return
            }
        }
    }
    
    func buttonView(destination:some View, imageString: String, width:CGFloat, height:CGFloat) -> some View {
        
        return (
            ZStack {
                NavigationLink(destination: destination) {
                    EmptyView()
                }.frame(width: 0)
                    .opacity(0)
                
                Button(action: {},
                       label: {
                    Image(imageString)
                        .resizable()
                        .frame(width: width, height: height)
                        .cornerRadius(5.0)
                }).buttonStyle(PlainButtonStyle())
            })
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
