//
//  ListView.swift
//  News-API-Mac
//
//  Created by Марк Киричко on 06.06.2023.
//

import SwiftUI

struct ListView: View {
    
    let tabs: [TabModel]
    
    @Binding var currentTab: Int
    
    var body: some View {
        List(tabs, id: \.id) { tab in
            HStack {
                SpringImageView(image: tab.icon, width: 30, height: 30) {
                    
                }
                Text(tab.name)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(8)
            .onTapGesture {
                currentTab = tab.id
            }
        }
    }
}
