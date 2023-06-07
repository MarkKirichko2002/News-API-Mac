//
//  TopNewsListView.swift
//  News-API-Mac
//
//  Created by Марк Киричко on 06.06.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct TopNewsListView: View {
    
    @ObservedObject var viewModel = TopNewsListViewModel()
    
    var body: some View {
        NewsListView(articles: viewModel.news)
        .navigationTitle("Главное")
    }
}

struct TopNewsListView_Previews: PreviewProvider {
    static var previews: some View {
        TopNewsListView()
    }
}
