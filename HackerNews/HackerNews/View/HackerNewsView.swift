//
//  ContentView.swift
//  HackerNews
//
//  Created by Damian Sznajder on 16/02/2021.
//

import SwiftUI

struct HackerNewsView: View {
    
    @ObservedObject var viewModel: HackerNewsViewModel
    @State var currentDate = Date()
    
    private let timer = Timer.publish(every: 10, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.articles) { article in
                    VStack(alignment: .leading) {
                        Text(article.title)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .lineLimit(1)
                        HStack {
                            TimeBadgeView(time: article.time, currentDate: currentDate)
                            Spacer()
                            Text(article.by).font(.body)
                        }
                        .padding(.top)
                    }
                }
            }
            .navigationTitle("\(viewModel.articles.count) articles")
        }
        .onReceive(timer) { currentDate = $0 }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HackerNewsView(viewModel: HackerNewsViewModel())
    }
}
