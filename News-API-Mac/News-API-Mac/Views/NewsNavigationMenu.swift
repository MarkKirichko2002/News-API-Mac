//
//  NewsNavigationMenu.swift
//  News-API-Mac
//
//  Created by Марк Киричко on 06.06.2023.
//

import SwiftUI

struct NewsNavigationMenu: View {
    
    @State var tab = 1
    
    var tabs: [TabModel] =
    [
        .init(id: 1, name: "главное", icon: "fire"),
        .init(id: 2, name: "категории", icon: "newspaper"),
        .init(id: 3, name: "поиск", icon: "magnifying-glass"),
        .init(id: 4, name: "настройки", icon: "gear")
    ]
    
    var body: some View {
        NavigationView {
            ListView(tabs: tabs, currentTab: $tab)
            switch tab {
            case 1:
                TopNewsListView()
            case 2:
                NewsCategoriesListView()
            case 3:
                SearchNewsListView()
            default:
                EmptyView()
            }
        }
    }
}

struct NewsNavigationMenu_Previews: PreviewProvider {
    static var previews: some View {
        NewsNavigationMenu()
    }
}
