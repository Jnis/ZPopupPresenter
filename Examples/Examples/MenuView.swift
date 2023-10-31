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
    @State var blurValue: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 24) {
        
            HStack {
                Color.blue
                Color.yellow
                Color.gray
                Color.white
                Color.black
                Color.red
            }
            .frame(height: 100)
            
            Spacer()
            
            Button("Show Demo 1", action: {
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
            
            Button("Show Demo 3", action: {
                zPopupPresenterModel.showPopup({ close in
                    AnyView(
                        Demo3View(close: close, blurValue: $blurValue)
                    )
                })
            })
            
            Button("Show Demo 4 (snackbar)", action: {
                zPopupPresenterModel.showPopup({ close in
                    AnyView(
                        Demo4View(title: "Title", text: "\(Date())", close: close)
                    )
                })
            })
            
            Spacer()
        }
        .blur(radius: blurValue)
    }
}

struct MenuView_Previews: PreviewProvider {
    static let zPopupPresenterModel = ZPopupPresenterModel()
    
    static var previews: some View {
        MenuView()
            .environmentObject(zPopupPresenterModel)
    }
}
