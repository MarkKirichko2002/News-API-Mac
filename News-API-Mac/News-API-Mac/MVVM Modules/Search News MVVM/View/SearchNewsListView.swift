//
//  SearchNewsListView.swift
//  News-API-Mac
//
//  Created by Марк Киричко on 07.06.2023.
//

import SwiftUI

struct SearchNewsListView: View {
    
    @StateObject var viewModel = SearchNewsListViewModel()
    
    var body: some View {
        NewsListView(articles: viewModel.SearchNews())
            .navigationTitle("\(viewModel.selectedNewsCategory.name): \(viewModel.news.count)")
            .searchable(text: $viewModel.searchText)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        // категории новостей
                        Picker("", selection: $viewModel.selectedNewsCategory) {
                            ForEach(NewsCategories.categories, id: \.self) { category in
                                Text(category.name)
                            }
                        }
                        .onChange(of: viewModel.selectedNewsCategory) { category in
                            viewModel.GetNews(category: category)
                        }
                    }
                }
          }
    }
}

struct SearchNewsListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchNewsListView()
    }
}
