//
//  TopNewsListViewModel.swift
//  News-API-Mac
//
//  Created by Марк Киричко on 06.06.2023.
//

import Foundation

class TopNewsListViewModel: ObservableObject {
    
    @Published var news = [Article]()
    
    // MARK: - Init
    init() {
        getTopNews()
    }
    
    func getTopNews() {
        NewsService.shared.execute(with: News.self, category: .general) { [weak self] result in
            switch result {
            case .success(let data):
                guard let news = data.articles else {return}
                DispatchQueue.main.async {
                    self?.news = news
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
