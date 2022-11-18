//
//  Demo2DetaisView.swift
//  Examples
//
//  Created by Yanis Plumit on 11.11.2022.
//

import SwiftUI

struct Demo2DetailsView: View {
    enum AnimationIDs {
        static let image = "image"
        static let title = "title"
        static let bg = "bg"
    }
    
    var namespace: Namespace.ID
    let close: () -> Void
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Image("pig")
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: Demo2DetailsView.AnimationIDs.image, in: namespace)
                    
                    HStack {
                        Text(Constants.demoTitle)
                            .font(.title)
                            .matchedGeometryEffect(id: Demo2DetailsView.AnimationIDs.title, in: namespace, properties: .position)
                        Spacer()
                    }.padding()
                    
                    HStack {
                        Text(Constants.demoTitleDescription)
                        Spacer()
                    }.padding()
                }
            }
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        close()
                    }, label: {
                        Text("Close popup")
                            .padding()
                            .foregroundColor(.blue)
                            .background(Capsule().foregroundColor(.yellow))
                    })
                }
                Spacer()
            }
        }
        .background(.white)
        .matchedGeometryEffect(id: Demo2DetailsView.AnimationIDs.bg, in: namespace)
    }
    
}

struct Demo2DetailsView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        Demo2DetailsView(namespace: namespace, close: {})
    }
}
