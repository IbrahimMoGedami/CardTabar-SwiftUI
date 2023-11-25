//
//  MainTabbarView.swift
//  CustomTabBar-SwiftUI
//
//  Created by Ibrahim Mo Gedami on 11/22/23.
//

import SwiftUI

struct MainTabbarView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(0)
                FavoriteView()
                    .tag(1)
                ChatView()
                    .tag(2)
                ProfileView()
                    .tag(3)
            }
        }
        
        ZStack {
            HStack {
                ForEach(TabbarItem.allCases, id: \.self) { item in
                    Button{
                        selectedTab = item.rawValue
                    } label: {
                        customTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                    }
                }
                .padding(6)
            }
            .frame(height: 70)
            .background(.purple.opacity(0.2))
            .cornerRadius(35)
            .padding(.horizontal, 5)
        }
    }
    
}

extension MainTabbarView {
    
    func customTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10) {
            Spacer()
            Image(imageName)
                .resizable()
                .renderingMode(.original)
                .foregroundColor(isActive ? .black : .gray)
                .frame(width: 20, height: 20)
            if isActive {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? .black : .gray)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 60, height: 60)
        .background(isActive ? .purple.opacity(0.4) : .clear)
        .cornerRadius(30)
    }
    
}

#Preview {
    MainTabbarView()
}
