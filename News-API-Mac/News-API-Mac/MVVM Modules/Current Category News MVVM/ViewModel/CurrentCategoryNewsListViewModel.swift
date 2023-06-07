//
//  CurrentCategoryNewsListViewModel.swift
//  News-API-Mac
//
//  Created by Марк Киричко on 07.06.2023.
//

import Foundation

class CurrentCategoryNewsListViewModel: ObservableObject {
    
    @Published var news = [Article]()
    private let newsService = NewsService()
    
    func GetNewsByCategory(endpoint: NewsCategory) {
        newsService.execute(with: News.self, category: endpoint) { [weak self] result in
            switch result {
            case .success(let data):
                guard let news = data.articles else {return}
                self?.news = news
            case .failure(let error):
                print(error)
            }
        }
    }
}
