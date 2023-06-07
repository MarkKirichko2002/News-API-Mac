//
//  SearchNewsListViewModel.swift
//  News-API-Mac
//
//  Created by Марк Киричко on 07.06.2023.
//

import Foundation

class SearchNewsListViewModel: ObservableObject {
    
    @Published var news = [Article]()
    @Published var searchText = ""
    @Published var selectedNewsCategory = NewsCategories.categories[0]
    
    // MARK: - Init
    init() {
        GetNews(category: selectedNewsCategory)
    }
    
    func GetNews(category: NewsCategoryModel) {
        NewsService.shared.execute(with: News.self, category: category.endpoint) { [weak self] result in
            switch result {
            case .success(let data):
                guard let news = data.articles else {return}
                self?.news = news
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func SearchNews()-> [Article] {
        if searchText.isEmpty {
            return news
        } else {
            return news.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
