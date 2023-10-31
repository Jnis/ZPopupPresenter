//
//  Demo4View.swift
//  Examples
//
//  Created by Yanis Plumit on 31.10.2023.
//

import Foundation
import SwiftUI

struct Demo4View: View {
    @State private var sheetOffset = -UIScreen.main.bounds.height
    
    let title: String
    let text: String?
    let close: () -> Void
    
    var body: some View {
        VStack {
            toastView
                .padding(.horizontal, 24)
                .padding(.top, 15)
                .offset(CGSize(width: 0, height: sheetOffset))
            Spacer()
        }
        .onAppear {
            showWithAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                closeWithAnimation({})
            })
        }
    }
    
    private var toastView: some View {
        HStack(alignment: .top, spacing: 10) {
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .foregroundColor(.black)
                    .font(.title)
                    .lineLimit(2)
                if let text {
                    Text(text)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(Color.yellow)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
    
    func showWithAnimation() {
        withAnimation(.spring(duration: 0.3, bounce: 0.2)) {
            self.sheetOffset = 0
        }
    }
    
    func closeWithAnimation(_ completion: @escaping () -> Void) {
        withAnimation(.easeInOut(duration: 0.3)) {
            self.sheetOffset = -UIScreen.main.bounds.height
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            close()
            completion()
        })
    }
}

struct Demo4View_Previews: PreviewProvider {
    static var previews: some View {
        Demo4View(title: "Title", text: "Subtitle", close: {})
    }
}
