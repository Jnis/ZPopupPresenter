//
//  MenuView.swift
//  Examples
//
//  Created by Yanis Plumit on 11.11.2022.
//

import SwiftUI
import ZPopupPresenter

struct MenuView: View {
    @EnvironmentObject var zPopupPresenterModel: ZPopupPresenterModel
    
    var body: some View {
        VStack(spacing: 24) {
        
            Button("Show Demo 1",
                   action: {
                zPopupPresenterModel.showPopup({ close in
                    AnyView(
                        Demo1View(buttonsOffset: 100, close: close)
                            .environmentObject(zPopupPresenterModel)
                    )
                })
            })
                
            NavigationLink(destination: {
                Demo2View()
                    .environmentObject(zPopupPresenterModel)
            }, label: {
                Text("Show Demo 2")
            })
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
