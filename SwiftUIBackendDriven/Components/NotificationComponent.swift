//
//  NotificationComponent.swift
//  SwiftUIBackend
//
//  Created by seyhunak on 07/05/20.
//  Copyright © 2020 seyhunak. All rights reserved.
//

import Foundation
import SwiftUI

struct NotificationComponent: UIComponent {
    var uniqueId: String
    let model: NotificationUIModel
    
    func render(uiDelegate: UIDelegate) -> AnyView {
        NotificationView(component: self, delegate: uiDelegate as! NotificationDelegate, model: model).toAny()
    }
}

struct NotificationView: View {
    let component: NotificationComponent
    let delegate: NotificationDelegate
    let model: NotificationUIModel
    var body: some View {
        VStack {
            HStack {
                Text(model.message)
                    .font(.headline)
                    .frame(alignment: Alignment.leading)
                
                Spacer()
                Text("Cancel")
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .onTapGesture {
                        self.delegate.cancelTapped(
                            identifier: self.component.uniqueId
                        )
                }
            }
            HStack {
                Spacer()
                Button(action: {
                    self.delegate.actionTapped()
                }) {
                    Text(model.actionText)
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
            }
        }
        .padding()
    }
}

struct NotificationUIModel {
    let message: String
    let actionText: String
}

class ProxyUIDelegate : UIDelegate {}

protocol NotificationDelegate: UIDelegate {
    func cancelTapped(identifier: String)
    func actionTapped()
}
