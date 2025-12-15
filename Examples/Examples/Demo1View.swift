//
//  Demo1View.swift
//  Examples
//
//  Created by Yanis Plumit on 11.11.2022.
//

import SwiftUI
import ZPopupPresenter

struct Demo1View: View {
    @EnvironmentObject var zPopupPresenterModel: ZPopupPresenterModel
    
    let buttonsOffset: CGFloat
    let close: () -> Void
    
    var body: some View {
        VStack {
            Spacer().frame(height: buttonsOffset)
            
            HStack {
                showPopupWithAnimationButton
                
                Button(action: {
                    close()
                }, label: {
                    HStack {
                        Spacer()
                        Text("Close popup")
                            .padding()
                            .foregroundColor(.blue)
                            .background(Capsule().foregroundColor(.yellow))
                        Spacer()
                    }
                })
            }
            
            Spacer()
        }
        .background(Color.gray.opacity(0.8))
    }
    
    var showPopupWithAnimationButton: some View {
        Button(action: {
            withAnimation {
                zPopupPresenterModel.showPopup({ close in
                    Demo1View(buttonsOffset: buttonsOffset + 50, close: {
                        withAnimation {
                            close()
                        }
                    })
                    .environmentObject(zPopupPresenterModel)
                    .transition(.slide)
                })
            }
        }, label: {
            HStack {
                Spacer()
                Text("With Animation")
                    .padding()
                    .foregroundColor(.blue)
                    .background(Capsule().foregroundColor(.white))
                Spacer()
            }
        })
    }
    
}

struct Demo1View_Previews: PreviewProvider {
    static var previews: some View {
        Demo1View(buttonsOffset: 0, close: {})
    }
}
