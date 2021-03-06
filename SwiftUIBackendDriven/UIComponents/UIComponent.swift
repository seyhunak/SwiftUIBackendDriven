//
//  UIComponent.swift
//  SwiftUIBackend
//
//  Created by seyhunak on 07/05/20.
//  Copyright © 2020 seyhunak. All rights reserved.
//

import Foundation
import SwiftUI


protocol UIDelegate {}

protocol UIComponent {
    var uniqueId: String  { get }
    func render(uiDelegate: UIDelegate) -> AnyView
}

extension View {
    func toAny() -> AnyView {
        return AnyView(self)
    }
}


func renderPage(ui: [UIComponent], uiDelegate: UIDelegate) -> AnyView {
    return
        ScrollView(.vertical) {
            VStack {
                HStack {
                    Spacer()
                }
                ForEach(ui, id: \.uniqueId) { uiComponent in
                    uiComponent.render(uiDelegate: uiDelegate)
                }
                .transition(AnyTransition.scale)
                Spacer()
            }

        }.toAny()
}
