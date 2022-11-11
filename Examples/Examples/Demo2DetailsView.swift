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
                        Text("Run Pig Run!")
                            .font(.title)
                            .padding(.bottom, 16)
                            .matchedGeometryEffect(id: Demo2DetailsView.AnimationIDs.title, in: namespace, properties: .position)
                        Spacer()
                    }.padding()
                    
                    HStack {
                        Text(description)
                            .padding(.bottom, 16)
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
    
    let description = """
The piggy escaped from cage and he are waiting your help!

Only you can help out the little pig to escape slaughterhouse, where prepare amazing pork. And we don't promise you, that it will be easy, but it will be interesting and exciting!!

The success of the little piggy only in your hands.
"""
}

struct Demo2DetailsView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        Demo2DetailsView(namespace: namespace, close: {})
    }
}
