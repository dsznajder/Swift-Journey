//
//  WholeFoodApp.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import SwiftUI

@main
struct WholeFoodApp: App {
    var body: some Scene {
        WindowGroup {
            WholeFoodTabView().environmentObject(OrderModel())
        }
    }
}
