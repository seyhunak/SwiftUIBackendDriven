//
//  ContentView.swift
//  SwiftUIBackend
//
//  Created by seyhunak on 07/05/20.
//  Copyright © 2020 seyhunak. All rights reserved.
//

import SwiftUI

struct HomePageView: View, UIDelegate, NotificationDelegate {
    @ObservedObject
    var controller: HomePageController

    var body: some View {
        renderPage(ui: controller.uiComponents, uiDelegate: self)
            .onAppear(perform: {
                self.controller.loadPage()
            })
            .background(SwiftUI.Color.white.edgesIgnoringSafeArea(.all))
    }

    func cancelTapped(identifier: String) {
        withAnimation { 
            self.controller.removeComponent(id: identifier)
        }
    }

    func actionTapped() {
        withAnimation {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(controller: HomePageController())
    }
}
