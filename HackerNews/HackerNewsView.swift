//
//  ContentView.swift
//  HackerNews
//
//  Created by Damian Sznajder on 16/02/2021.
//

import SwiftUI

struct HackerNewsView: View {
    
    @ObservedObject var viewModel: HackerNewsViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.articles) { article in
                    VStack {
                        Text(article.title).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        HStack {
                            Spacer()
                            Text(article.by).font(.body)
                        }
                    }
                }
            }
            .navigationTitle("\(viewModel.articles.count) articles")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HackerNewsView(viewModel: HackerNewsViewModel())
    }
}
