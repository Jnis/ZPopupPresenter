//
//  ZPopupPresenterView.swift
//
//
//  Created by Yanis Plumit on 11.11.2022.
//

import SwiftUI

extension ZPopupPresenterModel {
    public func showPopup<T: View>(_ makeViewClosure: (_ close: @escaping () -> Void) -> T) {
        self.showPopup({ close in
            AnyView(
                makeViewClosure(close)
            )
        })
    }
}

public class ZPopupPresenterModel: ObservableObject {
    @Published var popupModels: [PopupModel] = []
    
    public init() { }
    
    public func showPopup(_ makeViewClosure: (_ close: @escaping () -> Void) -> AnyView) {
        let popupModel = PopupModel()
        popupModel.content = makeViewClosure({[weak popupModel, weak self] in
            guard let self = self, let popupModel = popupModel else { return }
            // remove from displaying
            popupModel.content = nil
            // clear popup wrappers
            let noPopups = nil == self.popupModels.first { $0.content != nil }
            if noPopups {
                self.popupModels = []
            }
        })
        popupModels.append(popupModel)
    }
}

public struct ZPopupPresenterView: View {
    @ObservedObject var model: ZPopupPresenterModel
    
    public init(model: ZPopupPresenterModel) {
        self._model = ObservedObject(wrappedValue: model)
    }
    
    public var body: some View {
        ZStack {
            ForEach(0..<model.popupModels.count, id: \.self) { index in
                PopupWrapperView(popupModel: model.popupModels[index])
                    .zIndex(CGFloat(index + 1))
            }
        }
    }
}

class PopupModel: ObservableObject {
    @Published var content: AnyView?
}

struct PopupWrapperView: View {
    @ObservedObject var popupModel: PopupModel
    
    var body: some View {
        popupModel.content
    }
}
