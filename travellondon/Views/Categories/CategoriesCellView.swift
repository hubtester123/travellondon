//
//  CategoriesCellView.swift
//  travellondon
//
//  Created by Tony Cheung on 22/10/2022.
//

import SwiftUI

struct CategoriesCellView: View {
    
    var categories:DisplayCategory
    
    var horizontalRectangularImageWidth: CGFloat {
        UIScreen.main.bounds.width - 10.0
    }
    var horizontalRectangularImageHeight: CGFloat {
        horizontalRectangularImageWidth * 190.0 / 396.0
    }
    
    var squareImageWidth: CGFloat {
        horizontalRectangularImageWidth/2 - (5.0 / 2)
    }
    var squareImageHeight: CGFloat {
        squareImageWidth
    }
    
    var verticalRectangualrImageWidth: CGFloat {
        squareImageWidth
    }
    var verticalRectangualrImageHeight: CGFloat {
        verticalRectangualrImageWidth * 292.0 / 196.0
    }
    
    var body: some View {
        VStack(spacing:0) {
            HStack {
                buttonView(destination: ExplorerView(),
                           imageString: categories.displayCategories[0],
                           width: horizontalRectangularImageWidth,
                           height: horizontalRectangularImageHeight)
            }
            HStack(spacing:5.0) {
                VStack(spacing:0) {
                    buttonView(destination: MoreView(),
                               imageString: categories.displayCategories[1],
                               width: squareImageWidth,
                               height: squareImageHeight)
                    .padding([.top], 5.0)
                    
                    
                    buttonView(destination: MoreView(),
                               imageString: categories.displayCategories[2],
                               width: verticalRectangualrImageWidth,
                               height: verticalRectangualrImageHeight)
                    .padding([.top], 5.0)
                }
                

                
                VStack(spacing:0) {
                    
                    buttonView(destination: MoreView(),
                               imageString: categories.displayCategories[3],
                               width: verticalRectangualrImageWidth,
                               height: verticalRectangualrImageHeight)
                    .padding([.top], 5.0)
                    
                    buttonView(destination: MoreView(),
                               imageString: categories.displayCategories[4],
                               width: squareImageWidth,
                               height: squareImageHeight)
                    .padding([.top], 5.0)
                }
            }
        }.listRowBackground(Color.clear)
    }
    
    private func buttonView(destination:some View, imageString: String, width:CGFloat, height:CGFloat) -> some View {
        
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

struct CategoriesCellView_Previews: PreviewProvider {
    static var previews: some View {
        
        let categories = DisplayCategory(displayCategories:["nearme" , "offers", "mustsee", "priceless", "free"])
        CategoriesCellView(categories: categories)
    }
}
