//
//  CurrentCategoryNewsListView.swift
//  News-API-Mac
//
//  Created by Марк Киричко on 07.06.2023.
//

import SwiftUI

struct CurrentCategoryNewsListView: View {
    
    @StateObject var viewModel = CurrentCategoryNewsListViewModel()
    var endpoint: NewsCategory
    
    var body: some View {
        NewsListView(articles: viewModel.news)
        .onAppear {
            viewModel.GetNewsByCategory(endpoint: endpoint)
        }
    }
}


struct CurrentCategoryNewsListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentCategoryNewsListView(endpoint: .general)
    }
}
