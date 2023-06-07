//
//  TopNewsListViewModel.swift
//  News-API-Mac
//
//  Created by Марк Киричко on 06.06.2023.
//

import Foundation

class TopNewsListViewModel: ObservableObject {
    
    @Published var news = [Article]()
    private let newsService = NewsService()
    
    init() {
        getTopNews()
    }
    
    func getTopNews() {
        newsService.execute(with: News.self, category: .general) { [weak self] result in
            switch result {
            case .success(let data):
                guard let news = data.articles else {return}
                self?.news = news
                print(news)
            case .failure(let error):
                print(error)
            }
        }
    }
}
