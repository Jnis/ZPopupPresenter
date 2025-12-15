//
//  Demo2ItemView.swift
//  Examples
//
//  Created by Yanis Plumit on 11.11.2022.
//

import SwiftUI
import ZPopupPresenter

struct Demo2ItemView: View {
    @Namespace var namespace
    @EnvironmentObject var zPopupPresenterModel: ZPopupPresenterModel
    
    var body: some View {
        VStack {
            Image("pig")
                .resizable()
                .scaledToFit()
                .padding(.top, 20)
                .matchedGeometryEffect(id: Demo2DetailsView.AnimationIDs.image, in: namespace)
            
            Text("Run Pig Run!")
                .font(.title)
                .padding(.bottom, 16)
                .matchedGeometryEffect(id: Demo2DetailsView.AnimationIDs.title, in: namespace, properties: .position)
        }
        .background(Color.white.cornerRadius(20))
        .onTapGesture {
            withAnimation(.spring()) {
                zPopupPresenterModel.showPopup({ close in
                    Demo2DetailsView(namespace: namespace, close: {
                        withAnimation(.spring()) {
                            close()
                        }
                    })
                })
            }
        }
        .overlay(content: {
            Color.clear
                .matchedGeometryEffect(id: Demo2DetailsView.AnimationIDs.bg, in: namespace)
        })
    }
}

struct Demo2ItemView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            Demo2ItemView()
            Spacer()
        }
        .background(.black)
    }
}
