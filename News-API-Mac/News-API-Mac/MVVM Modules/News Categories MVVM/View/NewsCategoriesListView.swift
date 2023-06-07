//
//  NewsCategoriesListView.swift
//  News-API-Mac
//
//  Created by Марк Киричко on 06.06.2023.
//

import SwiftUI

struct NewsCategoriesListView: View {
    
    @StateObject var viewModel = NewsCategoriesListViewModel()
    
    var body: some View {
        List(viewModel.categories, id: \.id) { category in
            NavigationLink(destination: CurrentCategoryNewsListView(endpoint: category.endpoint)) {
                HStack(spacing: 15) {
                    Image(category.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 69, height: 60)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(category.name)
                            .fontWeight(.black)
                        Text("статей: \(category.articlesCount)")
                            .fontWeight(.black)
                    }
                }
            }
            Spacer()
        }
        .navigationTitle("Категории")
    }
}

struct NewsCategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCategoriesListView()
    }
}
