//
//  ZPopupPresenterView.swift
//
//
//  Created by Yanis Plumit on 11.11.2022.
//

import SwiftUI

extension ZPopupPresenterModel {
    class IDModel {
    }
    
    struct WrappedView: View {
        let idModel: IDModel
        let content: AnyView
        
        var body: some View {
            content
        }
    }
}

class ZPopupPresenterModel: ObservableObject {
    @Published var popups: [WrappedView] = []
    
    func showPopup(_ makeViewClosure: (_ close: @escaping () -> Void) -> AnyView) {
        let idModel = IDModel()
        let userView = makeViewClosure({[weak idModel, weak self] in
            guard let self = self, let idModel = idModel else { return }
            if let i = self.popups.firstIndex(where: { $0.idModel === idModel }) {
                self.popups.remove(at: i)
            }
        })
        popups.append(WrappedView(idModel: idModel, content: userView))
    }
}

struct ZPopupPresenterView: View {
    @StateObject var model: ZPopupPresenterModel
    
    var body: some View {
        ZStack {
            ForEach(0..<model.popups.count, id: \.self) { index in
                model.popups[index]
            }
        }
    }
}