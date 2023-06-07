//
//  NewsCategoriesViewModel.swift
//  News-API-Mac
//
//  Created by Марк Киричко on 06.06.2023.
//

import Foundation

class NewsCategoriesListViewModel: ObservableObject {
    
    @Published var categories = NewsCategories.categories
    private let newsService = NewsService()
    
    init() {
        GetNewsCategoriesData()
    }
    
    func GetNewsCategoriesData() {
        for category in categories {
            newsService.execute(with: News.self, category: category.endpoint) { [weak self] result in
                switch result {
                case .success(let data):
                    guard let news = data.articles else {return}
                    self?.categories[category.id - 1].articlesCount = news.count
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
