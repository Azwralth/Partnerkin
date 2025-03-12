//
//  MainView.swift
//  Partnerkin
//
//  Created by Владислав Соколов on 12.03.2025.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel(networkManager: NetworkManager())

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(viewModel.conferences, id: \.id) { conference in
                        NavigationLink(destination: DetailView()) {
                            MainViewCell(conference: conference)
                                .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Конференции")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.fetchConferences()
            }
        }
    }
}

#Preview {
    MainView()
}
