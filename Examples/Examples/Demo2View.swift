//
//  Demo2View.swift
//  Examples
//
//  Created by Yanis Plumit on 11.11.2022.
//

import SwiftUI
import ZPopupPresenter

struct Demo2View: View {
    @EnvironmentObject var zPopupPresenterModel: ZPopupPresenterModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem()]) {
                ForEach(0..<20, id: \.self) { i in
                    Demo2ItemView()
                        .environmentObject(zPopupPresenterModel)
                }
            }
            .background(.black)
        }
    }
}

struct Demo2View_Previews: PreviewProvider {
    static let zPopupPresenterModel = ZPopupPresenterModel()
    
    static var previews: some View {
        Demo2View()
            .environmentObject(zPopupPresenterModel)
    }
}
