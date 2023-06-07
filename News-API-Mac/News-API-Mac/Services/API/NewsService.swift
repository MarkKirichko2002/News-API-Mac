//
//  NewsService.swift
//  News-API-Mac
//
//  Created by Марк Киричко on 06.06.2023.
//

import Alamofire
import Foundation

class NewsService {
    
    struct Contacts {
        static let apiKey = "c6fb14909d524ae68ea631e5cb55ae67"
    }
    
    private var url = ""
    
    func execute<T: Codable>(with type: T.Type, category: NewsCategory, completion: @escaping(Result<T, Error>)->Void) {
        url = "https://newsapi.org/v2/top-headlines?country=ru&category=\(category.rawValue)&apiKey=\(Contacts.apiKey)"
        
        AF.request(url).responseData { response in
            guard let data = response.data else {return}
            
            do {
                let newsResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(newsResponse))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
    }
}
