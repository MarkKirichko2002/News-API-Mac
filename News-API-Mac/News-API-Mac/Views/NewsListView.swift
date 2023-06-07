//
//  NewsListView.swift
//  News-API-Mac
//
//  Created by Марк Киричко on 07.06.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsListView: View {
    
    var articles: [Article]
    
    var body: some View {
        List(articles, id: \.title) { article in
            HStack(spacing: 10) {
                WebImage(url: URL(string: article.urlToImage ?? "https://media.istockphoto.com/id/1175387759/vector/camera-icon.jpg?s=612x612&w=0&k=20&c=paC1ZkU31dH2B5epXqT_cYOyca5uqh4v0WpFUldCUBE="))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 90)
                    .clipShape(Rectangle())
                VStack(alignment: .leading, spacing: 15) {
                    Text(article.title)
                        .fontWeight(.black)
                    Text(article.description ?? "нет описания")
                        .fontWeight(.medium)
                    Text(article.author ?? "нет автора")
                        .fontWeight(.bold)
                }
            }
            Spacer()
        }
    }
}

//struct NewsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsListView()
//    }
//}
