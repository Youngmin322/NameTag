//
//  ContentView.swift
//  NameTag
//
//  Created by Youngmin Cho on 1/24/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("홈", systemImage: "house.fill") {
                NavigationStack {
                    EmptyView()
                }
            }
            
            Tab("명함", systemImage: "person.text.rectangle.fill") {
                NavigationStack {
                    EmptyView()
                }
            }
            
            Tab("교환", systemImage: "arrow.left.arrow.right") {
                NavigationStack {
                    EmptyView()
                }
            }
            
            Tab("마이페이지", systemImage: "person.circle.fill") {
                NavigationStack {
                    EmptyView()
                }
            }
            
            Tab(role: .search) {
                NavigationStack {
                    EmptyView()
                }
                //.searchable(text: $searchText, prompt: "프로젝트 이름 검색")
            }
        }
    }
}

#Preview {
    ContentView()
}
