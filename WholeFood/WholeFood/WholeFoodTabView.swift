//
//  WholeFoodTabView.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import SwiftUI

struct WholeFoodTabView: View {
    
    var body: some View {
        TabView {
            FoodListView()
                .tabItem {
                    Image(systemName: "list.dash")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .accentColor(Color("primary"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WholeFoodTabView()
    }
}
