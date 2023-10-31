//
//  ContentView.swift
//  Examples
//
//  Created by Yanis Plumit on 11.11.2022.
//

import SwiftUI
import ZPopupPresenter


struct ContentView: View {
    let zPopupPresenterModel = ZPopupPresenterModel() // 1. model
    
    var body: some View {
        NavigationView {
            TabView {
                MenuView()
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                    }
                    .environmentObject(zPopupPresenterModel) // 2. inject model for subviews
            }
        }
        .overlay {
            ZPopupPresenterView(model: zPopupPresenterModel) // 3. popups place
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
