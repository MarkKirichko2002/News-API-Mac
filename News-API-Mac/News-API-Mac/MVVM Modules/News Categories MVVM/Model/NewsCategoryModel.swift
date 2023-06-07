//
//  NewsCategoryModel.swift
//  News-API-Mac
//
//  Created by Марк Киричко on 06.06.2023.
//

import Foundation

struct NewsCategoryModel: Identifiable, Hashable {
    let id: Int
    let name: String
    let icon: String
    let sound: String
    let endpoint: NewsCategory
    var articlesCount: Int
    let voiceCommand: String
}
