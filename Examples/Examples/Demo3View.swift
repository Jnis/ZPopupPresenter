//
//  Demo3View.swift
//  Examples
//
//  Created by Yanis Plumit on 18.11.2022.
//

import SwiftUI

struct Demo3View: View {
    let close: () -> Void
    
    @State var sheetOffset = UIScreen.main.bounds.height
    @State var bgAlpha: CGFloat = 0
    @State var viewHeight: CGFloat = UIScreen.main.bounds.size.height
    @Binding var blurValue: CGFloat
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.2).ignoresSafeArea()
                .opacity(bgAlpha)
                .onTapGesture {
                    closeWithAnimation()
                }
            
            VStack {
                Spacer()
                VStack {
                    VStack(spacing: 0) {
                        Capsule()
                            .foregroundColor(.gray)
                            .frame(width: 42, height: 4)
                            .padding(.top, 12)
                            .padding(.bottom, 24)
                        
                        HStack {
                            Text(Constants.demoTitle)
                                .font(.title)
                            Spacer()
                        }.padding()
                        
                        HStack {
                            Text(Constants.demoTitleDescription)
                            Spacer()
                        }.padding()
                        .padding(.bottom, 48)
                        
                        Button(action: {
                            closeWithAnimation()
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
                        .padding(.bottom, 8)
                    }
                    .padding(.horizontal, 24)
                }
                .background(
                    ZStack {
                        let r: CGFloat = 12
                        let bgColor = Color.white
                        bgColor.cornerRadius(r).edgesIgnoringSafeArea(.all)
                        
                        bgColor.edgesIgnoringSafeArea(.all)
                            .offset(CGSize(width: 0, height: 300))
//                            .offset(CGSize(width: 0, height: viewHeight - r))
                    }
                )
                // TODO: dynamic height. It is available in another library.
//                .onHeightChanged({ newHeight in
//                    viewHeight = newHeight
//                })
                .offset(CGSize(width: 0, height: sheetOffset))
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            let newOffset = gesture.translation.height
                            if newOffset > 0 {
                                sheetOffset = newOffset
                            } else {
                                sheetOffset = newOffset * 0.2
                            }
                        }
                        .onEnded { _ in
                            if sheetOffset > 100 {
                                closeWithAnimation()
                            } else {
                                showWithAnimation()
                            }
                        }
                )
            }
        }
        .onAppear {
            self.sheetOffset = viewHeight
            showWithAnimation()
        }
    }
    
    func showWithAnimation() {
        withAnimation(.easeInOut(duration: 0.3)) {
            self.sheetOffset = 0
            self.bgAlpha = 1
            self.blurValue = 3.5
        }
    }
    
    func closeWithAnimation() {
        withAnimation(.easeInOut(duration: 0.3)) {
            self.sheetOffset = viewHeight
            self.bgAlpha = 0
            self.blurValue = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            close()
        })
    }
}

struct Demo3View_Previews: PreviewProvider {
    
    struct DemoView: View {
        @State var blurValue: CGFloat = 0
        var body: some View {
            ZStack {
                HStack {
                    Color.blue
                    Color.yellow
                    Color.gray
                    Color.white
                    Color.black
                    Color.red
                }.blur(radius: blurValue)
                Demo3View(close: {}, blurValue: $blurValue)
            }
        }
    }
    
    static var previews: some View {
        DemoView()
    }
}
